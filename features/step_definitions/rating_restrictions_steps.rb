Given(/^a user creates a proposal$/) do
  create_example_proposal
  @id = @proposal.id
  visit "/proposal/detail?proposal_id=#{@id}"

end

When(/^user votes a proposal positively$/) do
  click_link "Positive rating button"
end

Then(/^"([^"]*)" should be disabled$/) do |arg1|
  @btn = find_by_id('Positive rating button')
  expect(@btn[:class].include?("disabled")).to be_truthy
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
