Then(/^he should not see "([^"]*)" button$/) do |boton|
  expect{find(boton)}.to raise_error Capybara::ElementNotFound
end
