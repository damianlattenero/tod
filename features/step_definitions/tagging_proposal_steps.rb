Given(/^new proposal page$/) do
  visit 'proposal/new'
end

Given(/^no tags added$/) do
  fill_in 'proposal[tags]', :with => ''
end

Then(/^the proposal has (\d+) tags$/) do |number_of_tags|
  number = 0
  Tag.all.each_value do |proposal_list|
  	if proposal_list.include?(Proposal.all[0]) then
      number+=1
    end
  end
  expect(number).to be number_of_tags.to_i
end

Given(/^I add tag "(.*?)"$/) do |tag1|
  fill_in('proposal[tags]', :with => tag1)
end

Then(/^the proposal has tag "(.*?)"$/) do |tag1|
  expect(Tag.all[tag1]).to include(Proposal.all[0])#.id o .title ???#
end