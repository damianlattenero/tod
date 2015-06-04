require 'data_mapper'

class Role < DataMapper::Property::String
  def is_user?
    self.to_s.equal? Role.roles.user
  end

  def is_revisor?
    self.to_s.equal? Role.roles.revisor
  end

  def custom?
    true
  end

  def self.roles;
    {:user => 'user', :revisor => 'revisor', :admin => 'admin'}
  end
end
