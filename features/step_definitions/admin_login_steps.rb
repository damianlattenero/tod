# encoding: utf-8
Given(/^a user with mail "(.*?)"$/) do |mail|
  @mail = mail
  User.new_user @mail
  expect(User.first(:email => @mail)).not_to eq nil
end

When(/^logging in$/) do
  visit '/'
  click_link('Iniciar sesión con GitHub')
end

Then(/^he should not be logged as admin$/) do
  user = User.first(:email => @mail)
  expect(AdminManager.is_admin user).to eq false
end

Then(/^he should be logged as admin$/) do
  user = User.first(:email => @mail)
  expect(AdminManager.is_admin user).to eq true
end
