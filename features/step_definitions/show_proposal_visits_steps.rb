Given(/^a proposal with "(.*?)" visits$/) do |visits_num|
  @proposal = Proposal.create(
    :title       => "Proposal for visits",
    :description => "This is a proposal for visits description test",
    :author      => "Author",
    :email       => "some@email.com",
    :visits      => visits_num
  )
  @proposal.save!
end

When(/^user visits proposal list$/) do
  visit '/proposal/list'
  expect(page).to have_content 'Lista de Propuestas'
end

Then(/^should see proposal with "(.*?)" visits$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^user enters proposal details$/) do
  pending # express the regexp above with the code you wish you had
end
