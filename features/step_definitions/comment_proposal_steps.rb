require 'data_mapper'
require 'rspec'
require_relative '../../app/models/comment'

# Data base in memory
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_migrate!

Given(/^details proposal page$/) do
end

Given(/^a proposal$/) do
end

Given(/^comment body "(.*?)"$/) do |body|
  @body = body
end

Given(/^the author "(.*?)"$/) do |author_name|
  @author = author_name
end

When(/^submitted$/) do
  @comment = Comment.create(
    :author => @author, 
    :body   => @body, 
    :date   => Time.now
  )
  @comment.save
end

Then(/^the comment is added and listed on the proposal view$/) do
  Comment.all[0].should eq @comment
end

Then(/^I should see comment from "(.*?)" on top of comment from "(.*?)"$/) do |arg1, arg2|
end
