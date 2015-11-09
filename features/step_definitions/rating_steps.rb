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
  click_button(boton)
end

Given(/^user is logged in$/) do

  @mail = 'damianlattenero@gmail.com'
  @user = User.new_user @mail
  @user.name = 'Damian Lattenero'
  @user.save!
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
          :provider => :github,
          :uid => @user.uid
      }
  )
end

