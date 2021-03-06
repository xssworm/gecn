class AdminEmailsWorker
  include Sidekiq::Worker
  include DedicatedSidekiqQueue

  def perform(recipient_id, subject, body)
    recipient_list(recipient_id).pluck(:id).uniq.each do |user_id| 
      Notify.send_admin_notification(user_id, subject, body).deliver_later
    end
  end

  private

  def recipient_list(recipient_id)
    case recipient_id
    when 'all'
      User.active.subscribed_for_admin_email
    when /group-(\d+)\z/
      Group.find($1).users.merge(Member.active).subscribed_for_admin_email
    when /project-(\d+)\z/
      Project.find($1).team.users.references(:members).merge(Member.active).subscribed_for_admin_email
    end
  end
end
