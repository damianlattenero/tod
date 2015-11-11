require_relative '../../../app/models/user_vote'
require_relative '../../../app/models/user'
require_relative '../../../app/models/proposal'

describe UserVote do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :user) }
    it { should respond_to( :proposal) }
    it { should respond_to( :value) }
  end

  describe 'initialize' do
    it 'should create a user_vote' do
      proposal = Proposal.new
      user = User.new
      user_vote = UserVote.new

      user_vote.proposal= proposal
      user_vote.user= user
      user_vote.value= 1

      expect(user_vote.proposal).to eq proposal
      expect(user_vote.user).to eq user
      expect(user_vote.value).to eq 1
    end
  end

end
