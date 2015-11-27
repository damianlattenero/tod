Given(/^a user creates a proposal$/) do
  create_example_proposal
  @id = @proposal.id
  visit "/proposal/detail?proposal_id=#{@id}"

end

When(/^user votes a proposal positively$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  click_link "Positive_rating_button"
end

When(/^user votes a proposal negatively$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  click_link "Negative_rating_button"
end




Then(/^"([^"]*)" should be disabled$/) do |arg1|
  @btn = find_by_id('Positive_rating_button')
  expect(@btn[:class].include?("disabled")).to be_truthy
end

Then(/^only "([^"]*)" should be enabled$/) do |arg1|
  @positive_btn = find_by_id('Positive_rating_button')
  @negative_btn = find_by_id('Negative_rating_button')
  expect(@positive_btn[:class].include?("disabled")).to be_falsey
  expect(@negative_btn[:class].include?("disabled")).to be_truthy
end


def create_example_proposal()
  @proposal = Proposal.new
  @proposal.title = "Proposal test"
  @proposal.description = "A proposal description"
  @proposal.author = "An author"
  @proposal.email="test@dominio.com"
  @proposal.date = Time.now
  @proposal.tag_list = "agile"
  @proposal.save
end
