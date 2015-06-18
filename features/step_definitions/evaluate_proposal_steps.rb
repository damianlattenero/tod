Given(/^a proposal he did not evaluate yet$/) do
  @proposal = Proposal.create(
    :title       => "Proposal for evaluation",
    :description => "This is a proposal for evaluation description test",
    :author      => "Author"
  )
  @proposal.save
end

When(/^a revisor user visit proposal list$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^selects a proposal$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^clicks on "(.*?)" button$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^should see evaluation form$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^evaluates it with opinion "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^leaves a valid comment$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^evaluation confirmation with opinion "(.*?)" is displayed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
