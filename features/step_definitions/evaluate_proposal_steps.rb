And(/^a proposal he did not evaluate yet$/) do
  visit '/proposal/new'
  page.should have_content('Nueva Propuesta')
  fill_in 'proposal[title]', :with => "Proposal for comment"
  fill_in 'proposal[description]', :with => "Proposal for evaluation description test"
  fill_in 'proposal[author]', :with => "a test author who likes evaluations"
  click_button('Enviar')
  page.should have_content('Propuesta enviada correctamente')
  @proposal = Proposal.all[0]
  expect(@proposal.evaluations).to be_empty
end

When(/^a revisor user visit proposal list$/) do
  visit '/proposal/list'
  page.should have_content('Lista de Propuestas')
end

And(/^selects a proposal$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  page.should have_content('Proposal for evaluation')
end

When(/^clicks "(.*?)" button$/) do |button_label|
  find('#evaluate_btn').click
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

When(/^evaluates proposal$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^visits the proposal detail$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^should not be able to evaluate the proposal$/) do
  pending # express the regexp above with the code you wish you had
end
