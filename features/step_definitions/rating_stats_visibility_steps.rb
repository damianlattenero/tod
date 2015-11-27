Given(/^a proposal he did not vote yet$/) do
  create_example_proposal()
end

Then(/^he should see "([^"]*)" in votes percentage column$/) do |arg1|
  table_row = find('tr', text: @proposal.title)
  percentage = table_row.find('.votes_percentage')
  expect(percentage).to have_content(arg1)
end


Given(/^a proposal he already voted$/) do
  create_example_proposal()
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  click_link "Positive rating button"
end


Given(/^user visits proposal detail page$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end

Then(/^he should not see voting stats$/) do
  find('.voting_stats')
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
