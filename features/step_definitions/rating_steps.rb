# encoding: UTF-8
Given(/^proposal detail page$/) do
  @proposal = Proposal.new
  @proposal.title = "Proposal test"
  @proposal.description = "A proposal description"
  @proposal.author = "An author"
  @proposal.email="test@dominio.com"
  @proposal.date = Time.now
  @proposal.tag_list = "agile"
  @proposal.save
  @id = @proposal.id
  visit "/proposal/detail?proposal_id=#{@id}"
end

When(/^clicks on "(.*?)"$/) do |boton|
  click_link boton
end

Given(/^user already voted the current proposal$/) do
  click_link "Positive rating button"
end




Given(/^user is logged in$/) do

  @user       = User.new
  @user.name  = 'User'
  @user.email = 'user@mail.com'
  @user.role  = Role.new :user
  @user.uid  = 2
  @user.save!
  logger.debug "CREATED admin with UID=#{@user.uid}"
  create_new_session(@user.uid)
end

def create_new_session(uid)
  visit '/auth/log_out'
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                                  :provider => 'github',
                                                                  :uid => uid
                                                              })
  visit '/auth/sign_in'
  click_link('github-login')
end

