# require 'spec_helper'
require 'rspec'
#require 'data_mapper'

require_relative '../../../app/models/tag'

describe Tag do

  before(:all) do
    @proposal_mock = Proposal.new 
    @proposal_mock.title = 'A title'
    @proposal_mock.description = 'A description'
    @proposal_mock.author = 'An author'
  end

  before(:each) do
    @tag = Tag.new
    @tag.label = 'MyTag'
  end

  describe 'model' do
    it { should respond_to( :proposals_list) }
    it { should respond_to( :label) }
    it { should respond_to( :add_proposal) }
    it { should respond_to( :delete_proposal) }
    it { should respond_to( :include?) }
    it { should respond_to( :normalize_name) }
  end

  describe 'initialize' do
    it 'should create a proposals tag' do
      expect(@tag.proposals_list).to eq []
      expect(@tag.label).to eq 'MyTag'
    end
  end

  describe :add_proposal do
    it 'should add a tagged proposal' do

      @tag.add_proposal(@proposal_mock)

      expect(@tag.proposals_list.size).to eq 1
      expect(@tag.proposals_list).to include(@proposal_mock)
    end
  end
  
  describe :include? do
    it 'should include proposal' do
      
      @tag.add_proposal(@proposal_mock)
      expect(@tag.include?(@proposal_mock)).to be true
    end
  end

  describe :delete_proposal do
    it 'should delete tagged proposal' do

      @tag.add_proposal(@proposal_mock)
      @tag.delete_proposal(@proposal_mock)

      expect(@tag.proposals_list).to eq []
      expect(@tag.include?(@proposal_mock)).to be false
    end
  end

  describe :normalize_name do
    it 'should convert tag label to lowercase, remove symbols and swap spaces with _' do

      @tag.label = '   My un-norm4liZ3d%T4G      '
      @tag.normalize_name

      expect(@tag.label).to eq '#my_unnormlizdtg'
    end
  end
end