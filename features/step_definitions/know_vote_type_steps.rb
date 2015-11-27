Then(/^"([^"]*)" should be bigger than "([^"]*)"$/) do |button_bigger, button_smaller|
  expect(page).to have_css('#' + button_bigger + '.btn-lg')
  expect(page).to have_css('#' + button_smaller + '.btn-xs')
end