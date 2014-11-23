Given(/^added proposal with title "(.*?)"$/) do |title|
  @proposal = Proposal.create(
    :title => title,
    :description => "A proposal description",
    :author => "An author"
  )
  @proposal.save
end

Given(/^with tags "(.*?)"$/) do |tag_query|
  pending
end

When(/^I search with "(.*?)"$/) do |query|
  visit '/'
  fill_in('query', :with => query)
  click_button('Buscar')
end

Then(/^I should see no results$/) do
  expect(page).to have_content("No se han encontrado resultados")
end

Then(/^I should see (\d+) results$/) do |amount|
  page.should have_css("tbody#results tr", :count=>amount)
end

Then(/^result should be proposal with title "(.*?)"$/) do |title|
  expect(page).to have_content(title)
  expect(page).not_to have_content("No se han encontrado resultados")
end

