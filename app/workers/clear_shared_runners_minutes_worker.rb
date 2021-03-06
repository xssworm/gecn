class ClearSharedRunnersMinutesWorker
  LEASE_TIMEOUT = 3600

  include Sidekiq::Worker
  include CronjobQueue

  def perform
    return unless try_obtain_lease

    ProjectStatistics.update_all(
      shared_runners_seconds: 0,
      shared_runners_seconds_last_reset: Time.now)

    NamespaceStatistics.update_all(
      shared_runners_seconds: 0,
      shared_runners_seconds_last_reset: Time.now)
  end

  private

  def try_obtain_lease
    Gitlab::ExclusiveLease.new('gitlab_clear_shared_runners_minutes_worker',
      timeout: LEASE_TIMEOUT).try_obtain
  end
end
