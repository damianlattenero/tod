require 'data_mapper'
require 'rspec'
require_relative '../../app/models/proposal'

# Data base in memory
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_upgrade!

Given(/^a proposal list page without proposals$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I brownse the proposal list$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see no proposals$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^someone add proposal "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see proposal "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see proposal "(.*?)" on top of "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end