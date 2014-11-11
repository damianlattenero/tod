require 'rspec'
require_relative '../../app/models/proposal'
require_relative '../../app/models/proposal_administrator'

Given(/^a proposal administrator$/) do
  @proposal_administrator = ProposalAdministrator.new
end

Given(/^proposal title "(.*?)"$/) do |title|
  @title = title
end

Given(/^a description "(.*?)"$/) do |description|
  @description = description
end

Given(/^author nick "(.*?)"$/) do |author_nick|
  @author = author_nick
end

When(/^submitting$/) do
  @proposal_administrator.add_proposal(
    Proposal.new @title, @description, @author
  )
end

Then(/^proposal is added$/) do
  @proposal_administrator.proposals.length.should == 1
end

Then(/^it should raise an error$/) do
  expect { Proposal.new(@title, @description, @author) }.to raise_error
end

Then(/^the second proposal should have title "(.*?)"$/) do |new_title|
  @proposal_administrator.proposals[1].title.should eq new_title
end
