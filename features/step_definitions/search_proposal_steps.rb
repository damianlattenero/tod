Given(/^added proposal with title "(.*?)"$/) do |title|
  @proposal = Proposal.create(
    :title => title,
    :description => "A proposal description",
    :author => "An author"
  )
  @proposal.save
end

Given(/^with tags "(.*?)"$/) do |tag_query|
    pending # express the regexp above with the code you wish you had
end

When(/^I search with "(.*?)"$/) do |query|
  fill_in('search', :with => query)
  click_button('Buscar')
end

Then(/^I should see no results$/) do
  expect(page).to have_content("No se encontraron resultados")
end

Then(/^I should see (\d+) results$/) do |amount|
  expect(@proposals.length).to eq amount
end

Then(/^result should be proposal with title "(.*?)"$/) do |title|
  expect(page).to have_content(title)
end

