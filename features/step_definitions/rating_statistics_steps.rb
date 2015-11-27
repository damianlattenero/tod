# encoding: utf-8
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

Then(/^should see "([^"]*)" in porcentaje votos positivos$/) do |porcentaje_votos_positivos|
  visit '/proposal/list'
  expect(page).to have_content porcentaje_votos_positivos
end

When(/^user votes a proposal positively and log out$/) do
  click_link "Positive_rating_button"
  visit '/auth/log_out'
end



When(/^user votes a proposal negatively and log out$/) do
  click_link "Negative_rating_button"
  visit '/auth/log_out'
end

When(/^a user with mail "([^"]*)" votes a proposal positively$/) do |mail|
  visit '/'

  visit '/auth/sign_in'

  @mail = mail
  @user = User.new_user @mail
  @user.name = 'Albus'
  @user.save!
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
          :provider => 'github',
          :uid => @user.uid
      }
  )

  click_link('Iniciar sesión con GitHub')
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  click_link "Positive_rating_button"
end

When(/^a user with mail "([^"]*)" votes a proposal negatively$/) do |mail|
  visit '/'
  visit '/auth/log_out'
  visit '/auth/sign_in'
  @mail = mail
  @user = User.new_user @mail
  @user.name = 'Albus'
  @user.save!
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
          :provider => 'github',
          :uid => @user.uid
      }
  )
  visit '/'
  visit '/auth/sign_in'
  click_link('Iniciar sesión con GitHub')
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  click_link "Negative_rating_button"
end