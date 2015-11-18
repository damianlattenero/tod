require 'rubygems'
require 'dm-core'
require 'dm-tags'
require_relative '../mappers/proposal_session_type_mapper'
require_relative '../mappers/audience_mapper'
require_relative '../models/audience'
require_relative '../models/user_vote'

class Proposal
  include DataMapper::Resource

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
    user_vote = UserVote.new(:user => user,
                             :proposal => self,
                             :value => value)
    # user_vote.user = user
    # user_vote.proposal = self
    # user_vote.value = value
    user_vote
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
