require 'spec_helper'
require 'rspec'
require_relative '../../../app/models/proposal'

describe Proposal do
  describe 'initialize' do
    it 'should initialize with a title, a description and an author' do
      proposal = Proposal.new 'A title', 'A description', 'An author'
      proposal.title.should eq 'A title'
      proposal.description.should eq 'A description'
      proposal.author.should eq 'An author'
    end

    it 'should raise an error when title is "as"' do
      expect { Proposal.new('as', 'A description', 'An author') }.to raise_error
    end

    it 'should raise an error when description is empty' do
      expect { Proposal.new('A title', '', 'An author') }.to raise_error
    end

    it 'should raise an error when author is "h"' do
      expect { Proposal.new('A title', 'A description', 'h') }.to raise_error
    end
  end

  describe 'same_title' do
    it 'should be true' do
      proposal1 = Proposal.new 'A title', 'A description1', 'An author1'
      proposal2 = Proposal.new 'A title', 'A description2', 'An author2'
      proposal1.same_title?(proposal2).should eq true
    end

    it 'should be false' do
      proposal1 = Proposal.new 'A title1', 'A description1', 'An author1'
      proposal2 = Proposal.new 'A title2', 'A description2', 'An author2'
      proposal1.same_title?(proposal2).should eq false
    end
  end

  describe 'append_author_to_title' do
    it 'should have the title "A title - An author" when the title is "A title"
        and author is "An author"' do
      proposal = Proposal.new 'A title', 'A description', 'An author'
      proposal.append_author_to_title
      proposal.title.should eq 'A title - An author'
    end
  end
end

