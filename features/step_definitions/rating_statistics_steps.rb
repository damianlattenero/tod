Then(/^should see "([^"]*)" positive vote$/) do |votes|
  expect(page).to have_content votes
end

Then(/^should see "([^"]*)" negative vote$/) do |votes|
  expect(page).to have_content votes
end

Then(/^should see "([^"]*)" negative vote and "([^"]*)" positive votes$/) do |neg, pos|
  expect(page).to have_content neg
  expect(page).to have_content pos
end
