require 'data_mapper'

class Comment
  include DataMapper::Resource

  # property <name>, <type>
  property :id,          Serial
  property :author,      String, required: true, :length => 3..50
  property :body,        Text,   required: true, :length => 1..500
  property :date,        DateTime
  belongs_to :proposal

  def post
    self.author + " " + self.date.to_s + " " + self.body
  end
end
