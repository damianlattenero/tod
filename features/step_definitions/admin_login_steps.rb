# encoding: utf-8
Given(/^a user with mail "(.*?)"$/) do |mail|
  User.new_user mail
  expect(User.get(1).email).to eq mail
end

When(/^logging in$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^he should be logged as admin$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^he should not be logged as admin$/) do
  pending # express the regexp above with the code you wish you had
end
