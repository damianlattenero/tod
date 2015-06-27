And(/^a proposal with "(.*?)" comment$/) do |comentario|
  @proposal = Proposal.new
  @proposal.title = title
  @proposal.description = 'A proposal description'
  @proposal.author = 'Admin'
  @proposal.email  = 'some@email.com'
  @proposal.save!

  @comment = Comment.new
  @comment.author = "Autho2"
  @comment.body = comentario
  @comment.proposal_id= @proposal.id
  @comment.date = Time.now
  @comment.save!
end

When(/^admin user visits the proposals list$/) do
  visit '/proposal/list'
end

And(/^enters the details of the proposal$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end

And(/^click on the delete button of comment "(.*?)"$/) do |comentario|
  find("#delete-#{@comment.id}").click
end

Then(/^it should display "(.*?)"$/) do |msj|
  page.should have_content(msj)
end

And(/^comment "(.*?)" should not appear$/) do |comment|
pending
end

When(/^regular user visits the proposals list$/) do
  pending # express the regexp above with the code you wish you had
end


