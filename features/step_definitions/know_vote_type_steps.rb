Then(/^"([^"]*)" should be bigger than "([^"]*)"$/) do |button_bigger, button_smaller|
  expect(page).to have_css('#' + button_bigger + '.btn-lg')
  expect(page).to have_css('#' + button_smaller + '.btn-xs')
end

Then(/^"([^"]*)" should equale "([^"]*)"$/) do |pos, neg|
  expect(page).not_to have_css('#' + pos + '.btn-lg')
  expect(page).not_to have_css('#' + pos + '.btn-xs')
  expect(page).not_to have_css('#' + neg + '.btn-lg')
  expect(page).not_to have_css('#' + neg + '.btn-xs')
end
