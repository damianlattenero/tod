And(/^a proposal he did not evaluate yet$/) do
  @proposal = Proposal.create(
    :title       => "proposal for evaluation",
    :description => "proposal for evaluation description test",
    :author      => "a test author who likes to be evaluated"
  )
  @proposal.save
  expect(@proposal.evaluations).to be_empty
end

When(/^a revisor user visit proposal list$/) do
  visit '/proposal/list'
end

When(/^selects a proposal$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^clicks on Evaluate a proposal$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^evaluates its with opinion "(.*?)"$/) do |opinion|
  pending # express the regexp above with the code you wish you had
end

When(/^leaves a valid comment$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^evaluation confirmation with opinion "(.*?)" should be displayed$/) do |opinion|
  pending # express the regexp above with the code you wish you had
end

Then(/^it should raise a no opinion selected$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^comments "(.*?)"$/) do |comment|
  pending # express the regexp above with the code you wish you had
end

Then(/^evaluation confirmation with opinion "(.*?)" is displayed$/) do |opinion|
  pending # express the regexp above with the code you wish you had
end

When(/^clicks "(.*?)" button$/) do |button_label|
  pending # express the regexp above with the code you wish you had
end

When(/^evaluates proposal$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^visits the proposal detail$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^should not be able to evaluate the proposal$/) do
  pending # express the regexp above with the code you wish you had
end
