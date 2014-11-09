require 'rspec'
require_relative '../bin/proposal_administrator'
require_relative '../bin/proposal'

describe 'proposal_administrator' do
  describe 'add_proposal' do
    it 'should add a proposal' do
      proposal_administrator = ProposalAdministrator.new
      proposal_administrator.add_proposal(
        Proposal.new('A title', 'A description', 'An author1')
      )
      proposal_administrator.proposals.length.should be == 1
      proposal_administrator.add_proposal(
        Proposal.new('A title', 'A description', 'An author2')
      )
      proposal_administrator.add_proposal(
        Proposal.new('A title', 'A description', 'An author3')
      )
      proposal_administrator.proposals.length.should be == 3
    end

    it 'should add two proposals and the secod have the title modify' do
      proposal_administrator = ProposalAdministrator.new
      proposal_to_modify = Proposal.new(
        'A title', 'A description', 'An author2'
      )
      proposal_administrator.add_proposal(
        Proposal.new('A title', 'A description', 'An author1')
      )
      proposal_to_modify.title.should eq 'A title'
      proposal_administrator.add_proposal(proposal_to_modify)
      proposal_administrator.proposals.length.should be == 2
      proposal_to_modify.title.should eq 'A title - An author2'
    end
  end
end

