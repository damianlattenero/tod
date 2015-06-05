Given(/^there are (\d+) proposals$/) do |cant_prop|
  for i in 1..cant_prop.to_i
    proposal = Proposal.new
    proposal.title = i.to_s+"-a title"
    proposal.description = "-A proposal description"
    proposal.author = i.to_s+"-An author"
    proposal.tag_list = i.to_s+"-Tag"
    proposal.save
    end
end

When(/^a revisor user visits reports url$/) do
  visit '/report/page'
end

Then(/^reports page is displayed$/) do
  expect(page).to have_content("Reportes")
end

And(/^selects quantity report$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^quantity report is displayed with quantity (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^a non\-revisor user visits reports page$/) do
  pending
end

Then(/^a not\-found page is displayed$/) do
pending
end