Given(/^new proposal page$/) do
  visit 'proposal/new'
end

Given(/^no tags added$/) do
  fill_in 'proposal[tags]', :with => ''
end

Then(/^the proposal has (\d+) tags$/) do |number_of_tags|
  expect(Proposal.all[3].tags.size).to eq number_of_tags.to_i
end

Given(/^I add tag "(.*?)"$/) do |tag1|
  fill_in('proposal[tags]', :with => tag1)
end

Then(/^the proposal has tag "(.*?)"$/) do |tag1|
  expect(Proposal.all[3].tag_list).to include(tag1)
end