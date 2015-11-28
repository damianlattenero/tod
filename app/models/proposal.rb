require 'rubygems'
require 'dm-core'
require 'dm-tags'
require 'dm-paperclip'
require 'fileutils'
require_relative '../mappers/proposal_session_type_mapper'
require_relative '../mappers/audience_mapper'
require_relative '../models/audience'
require_relative '../models/user_vote'

APP_ROOT = File.expand_path(File.dirname(__FILE__))


class Proposal
  include DataMapper::Resource
  include Paperclip::Resource

  # property <name>, <type>
  property :id,          Serial
  property :title,       String, required: true, :length => 3..50
  property :description, Text,   required: true, :length => 1..500
  property :author,      String, required: true, :length => 3..50
  property :email,       String, required: true, :format => :email_address
  property :type,        ProposalSessionTypeMapper, :default  => ProposalSessionType.new(:presentation)
  property :audience,    AudienceMapper, :default  => Audience.new(:initial)
  property :visits,      Integer, :default => 0
  property :date,        DateTime

  has n,   :comments
  has n,   :evaluations
  has n,   :user_votes

  has_tags_on :tags

  has_attached_file :file,
                    :url => "/system/:attachment/:id/:style/:basename.:extension"


  def same_title?(a_proposal)
    self.title.eql? a_proposal.title
  end

  def append_author_to_title
    self.title += (" - " + @author)
  end

  def set_session(session)
    self.update!(:type => ProposalSessionType.new(session) )
  end

  def set_audience(audience)
    self.update!(:audience => Audience.new(audience) )
  end

  def evaluated_by?(username)
    self.evaluations.any? do |evaluation|
      evaluation.evaluator == username
    end
  end

  def vote(user, value)
    if not self.voted_by?(user)
      user_vote = UserVote.new(:user => user,
                             :proposal => self,
                             :value => value)
    else
      user_vote = self.user_votes.first(:user => user)
      user_vote.value = value
    end
    user_vote
  end

  def user_votes_avg
    cantidad_de_votos = self.user_votes.size
    cantidad_de_votos_positivos = self.user_votes.select {|vote| vote.value == 1}.size

    regla_de_tres = cantidad_de_votos_positivos * 100

    if cantidad_de_votos == 0
      return 0
    else
      regla_de_tres_resultado = regla_de_tres / cantidad_de_votos
    end

    return regla_de_tres_resultado
  end

  def voted_by?(user)
    return self.user_votes.any? do |vote|
      vote.user == user
    end
  end

  def positively_voted_by?(user)
    return self.user_votes.any? do |vote|
      vote.user == user and vote.value == 1
    end
  end

  def negatively_voted_by?(user)
    return self.user_votes.any? do |vote|
      vote.user == user and vote.value == -1
    end
  end

end
