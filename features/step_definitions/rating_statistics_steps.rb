Then(/^should see "([^"]*)" positive vote$/) do |votes|
  expect(page).to have_content votes
end
