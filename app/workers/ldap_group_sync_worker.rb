class LdapGroupSyncWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    logger.info 'Started LDAP group sync'
    EE::Gitlab::LDAP::Sync::Groups.execute
    logger.info 'Finished LDAP group sync'
  end
end