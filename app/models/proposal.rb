class Proposal
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String, required: true
  property :description, Text, required: true
  property :author, String, required: true

  def same_title?(a_proposal)
    @title.eql? a_proposal.title
  end

  def append_author_to_title
    @title += (" - " + @author)
  end
end

