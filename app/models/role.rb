class Role

  def initialize(rolename=:user)
    @rolename = rolename
  end

  def is_user?
    @rolename.equal? :user
  end

  def is_revisor?
    @rolename.equal? :revisor
  end

  def to_s
    @rolename.to_s
  end

end
