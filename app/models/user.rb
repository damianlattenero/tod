require 'data_mapper'

class User
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :email, String
  property :role, String
  property :uid, String
  property :provider, String

  def self.find_uid(uid)
    User.first(:uid => uid)
  end

  def self.new_from_omniauth(omniauth)
    user          = User.new
    user.uid      = omniauth["uid"]
    user.name     = omniauth["info"]["nickname"]
    user.role     = 'user'
    user.email    = omniauth["info"]["email"]
    user.provider = 'github'
    user.save!
    user
  end

end

