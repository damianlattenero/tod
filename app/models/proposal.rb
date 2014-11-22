require 'data_mapper'

class Proposal
  include DataMapper::Resource

  # property <name>, <type>
  property :id,          Serial
  property :title,       String, required: true, :length => 3..50
  property :description, Text,   required: true, :length => 1..500
  property :author,      String, required: true, :length => 3..50
  property :date,        DateTime
  has n, :tags, :through => Resource

  # has n,   :comments

  def same_title?(a_proposal)
    self.title.eql? a_proposal.title
  end

  def append_author_to_title
    self.title += (" - " + @author)
  end

  def tag!(tags)
    tags = tags.split(" ").map do |tag|
    Tag.find_or_create_by_label(tag)
    end
    self.tags << tags
  end
end