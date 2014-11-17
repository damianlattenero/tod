require 'data_mapper'
require 'rspec'
require_relative '../../app/models/proposal'

# Data base in memory
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_upgrade!

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
  @proposal = Proposal.create(
    :title       => @title, 
    :description => @description, 
    :author      => @author
  )
  @proposal.save
end

Then(/^proposal is added$/) do
  Proposal.all[0].should eq @proposal
end

Then(/^it should raise an error$/) do
  expect { Proposal.new(@title, @description, @author) }.to raise_error
end

Then(/^the second proposal should have title "(.*?)"$/) do |new_title|
  @proposal = Proposal.all[1]
  @proposal.append_author_to_title
  @proposal.save
  Proposal.all[1].title.should eq new_title
end