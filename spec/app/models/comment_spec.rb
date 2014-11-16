require 'rspec'

require_relative '../../../app/models/comment'
require_relative '../../../app/models/proposal'

describe Comment do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :author) }
    it { should respond_to( :body) }
    it { should respond_to( :date) }
    it { should respond_to( :proposal) }
  end

  describe 'initialize' do
    it 'should create a comment' do
      proposal = Proposal.new
      proposal.title = 'A title'
      proposal.description = 'A description'
      proposal.author = 'Hache'
      proposal.date = Time.now

      rigth_now = Time.now

      comment = Comment.new
      comment.author = 'Hachedeeme'
      comment.body = 'Body'
      comment.date = rigth_now
      comment.proposal = proposal

      comment.author.should eq "Hachedeeme"
      comment.body.should eq "Body"
      comment.date.should eql? rigth_now
      comment.proposal.should_not eq Proposal.new      
      comment.proposal.should eq proposal
  	end
  end

end
