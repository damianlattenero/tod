And(/^a proposal "([^"]*)" with (\d+) revisions$/) do |title, quantity|
  proposal = create_proposal title
  (0...quantity.to_i).each{ |i| create_evaluation(proposal, i.to_s)}
  @proposals_map ||= {}
  @proposals_map[title]=proposal
end

When(/^an admin user visits proposal "([^"]*)" details$/) do |title|
  proposal = @proposals_map[title]
  visit "/proposal/detail?proposal_id=#{proposal.id}"
end

And(/^the proposal does have (\d+) revisions$/) do |arg|
#   already explicit on background
end

Then(/^should see the "([^"]*)" button$/) do |button_label|
  expect(page).to have_css("button[id^='proposal-send-email']")
end

When(/^clicks on  "([^"]*)" button$/) do |button_label|
  click_button button_label
end

Then(/^it should display  "([^"]*)"$/) do |message|
  expect(page).to have_css('.toast-message', text: message)
end

def create_proposal(title)
  proposal = Proposal.new
  proposal.title = title
  proposal.description = 'A proposal description'
  proposal.author = 'An author'
  proposal.save!
  proposal
end

def create_evaluation(proposal, name)
  evaluation = Evaluation.new
  evaluation.evaluator = "Some #{name}"
  evaluation.comment = 'some comment'
  evaluation.opinion = EvaluationOpinion.new :strongly_agreed
  evaluation.proposal_id = proposal.id
  evaluation.save!
  evaluation
end