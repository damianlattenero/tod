require 'rspec'
require 'capybara/cucumber'

# include Capybara::DSL

Given(/^a proposal list page without proposals$/) do
  Proposal.all.destroy
  #Proposal.all.create
  expect(Proposal.all).to eq []
end

When(/^I browse the proposal list$/) do
  visit '/proposal/list'
end

Then(/^I should see no proposals$/) do
  pending
end

Given(/^someone add proposal "(.*?)"$/) do |proposal|
   Proposal.create(
    :title       => proposal,
    :description => "proposal description test", 
    :author      => "a test author"
  ).save
end

Then(/^I should see proposal "(.*?)"$/) do |proposal|
  expect(page).to have_content(proposal)
  page.should have_content(proposal)
  page.should have_content('a test author')
end

Then(/^proposal "(.*?)" has to be on top of "(.*?)"$/) do |arg1, arg2|
  pending
end