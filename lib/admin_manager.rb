class AdminManager
  include Singleton
  attr_accessor :admin_name

  def set_as_admin_if_eligible(some_user)
    logger.debug "LOGGED #{some_user} with name #{some_user.name}"
    if some_user && some_user.name == 'AlvarezAriel'
      some_user.set_admin
      logger.debug "USER #{some_user} set as ADMIN"
    end
  end

end
