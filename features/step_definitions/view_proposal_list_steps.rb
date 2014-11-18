Given(/^a proposal list page without proposals$/) do
  Proposal.all.destroy
  expect(Proposal.all).to eq []
end

When(/^I browse the proposal list$/) do
  visit '/proposal/list'
end

Then(/^I should see no proposals$/) do
  #page.should_not have_content(content)
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
  expect(page).to have_content('a test author')
end

Then(/^proposal "(.*?)" has to be on top of "(.*?)"$/) do |proposal1, proposal2|
  expect(page).to have_content(proposal1)
  expect(page).to have_content(proposal2)
  #page.should =~ /#{proposal1}.*#{proposal2}/m
  #expect(page).to match_array [/#{proposal1}.*#{proposal2}/m]
  #expect(page).to match /#{proposal1}.*#{proposal2}/m
end