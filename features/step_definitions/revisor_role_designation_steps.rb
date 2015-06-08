Given(/^an admin user$/) do
  @admin       = User.new
  @admin.name  = 'Admin'
  @admin.email = 'admin@mail.com'
  @admin.role  = Role.new :admin
  @admin.save!
  logger.debug "CREATED admin with UID=#{@admin.uid}"
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        :provider => 'github',
        :uid => @admin.uid
  })
  expect(User.first(:email => 'admin@mail.com')).not_to eq nil
end

Given(/^a regular user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^admin designates regular user as revisor$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^regular user should be revisor$/) do
  pending # express the regexp above with the code you wish you had
end
