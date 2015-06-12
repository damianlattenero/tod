require 'rubygems'
require 'dm-core'
require 'dm-tags'
require_relative '../mappers/session_mapper'
require_relative 'type'
class Proposal
  include DataMapper::Resource

  # property <name>, <type>
  property :id,          Serial
  property :title,       String, required: true, :length => 3..50
  property :description, Text,   required: true, :length => 1..500
  property :author,      String, required: true, :length => 3..50
  property :type,    SessionMapper, :default  => Type.new(:presentation)
  property :date,        DateTime
  has n,   :comments
  has_tags_on :tags

  def same_title?(a_proposal)
    self.title.eql? a_proposal.title
  end

  def append_author_to_title
    self.title += (" - " + @author)
  end

  def set_session(session)
    self.update!(:session => Type.new(session) )
  end


end

