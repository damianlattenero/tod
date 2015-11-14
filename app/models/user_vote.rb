require 'data_mapper'

class UserVote
  include DataMapper::Resource

  property :id,     Serial
  property :value,  Integer, required: true

  belongs_to :user
  belongs_to :proposal
end