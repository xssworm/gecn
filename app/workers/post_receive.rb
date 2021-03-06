class PostReceive
  include Sidekiq::Worker
  include DedicatedSidekiqQueue
  extend Gitlab::CurrentSettings

  def perform(repo_path, identifier, changes)
    repo_relative_path = Gitlab::RepoPath.strip_storage_path(repo_path)

    changes = Base64.decode64(changes) unless changes.include?(' ')
    # Use Sidekiq.logger so arguments can be correlated with execution
    # time and thread ID's.
    Sidekiq.logger.info "changes: #{changes.inspect}" if ENV['SIDEKIQ_LOG_ARGUMENTS']
    post_received = Gitlab::GitPostReceive.new(repo_relative_path, identifier, changes)

    if post_received.project.nil?
      log("Triggered hook for non-existing project with full path \"#{repo_relative_path}\"")
      return false
    end

    if post_received.wiki?
      update_wiki_es_indexes(post_received)

      # Triggers repository update on secondary nodes when Geo is enabled
      Gitlab::Geo.notify_wiki_update(post_received.project) if Gitlab::Geo.enabled?
    elsif post_received.regular_project?
      # TODO: gitlab-org/gitlab-ce#26325. Remove this.
      if Gitlab::Geo.enabled?
        hook_data = {
          event_name: 'repository_update',
          project_id: post_received.project.id,
          project: post_received.project.hook_attrs,
          remote_url: post_received.project.ssh_url_to_repo
        }

        SystemHooksService.new.execute_hooks(hook_data, :repository_update_hooks)
      end

      process_project_changes(post_received)
    else
      log("Triggered hook for unidentifiable repository type with full path \"#{repo_relative_path}\"")
      false
    end
  end

  def process_project_changes(post_received)
    post_received.changes.each do |change|
      oldrev, newrev, ref = change.strip.split(' ')

      @user ||= post_received.identify(newrev)

      unless @user
        log("Triggered hook for non-existing user \"#{post_received.identifier}\"")
        return false
      end

      if Gitlab::Git.tag_ref?(ref)
        GitTagPushService.new(post_received.project, @user, oldrev: oldrev, newrev: newrev, ref: ref).execute
      elsif Gitlab::Git.branch_ref?(ref)
        GitPushService.new(post_received.project, @user, oldrev: oldrev, newrev: newrev, ref: ref).execute
      end
    end
  end

  def update_wiki_es_indexes(post_received)
    return unless current_application_settings.elasticsearch_indexing?

    post_received.project.wiki.index_blobs
  end

  private

  def log(message)
    Gitlab::GitLogger.error("POST-RECEIVE: #{message}")
  end
end
