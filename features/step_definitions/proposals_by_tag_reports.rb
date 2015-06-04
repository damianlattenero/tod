Given(/^a revisor user$/) do
  @revisor= User.new
  @revisor.name= "Un nombre"
  @revisor.email= "revisor@tod.com"
  @revisor.role= Role.new(:revisor)
  @revisor.save
end

Given(/^there are (\d+) proposals with tag "([^"]*)" only$/) do |cant_prop, tag|
  for i in 1..cant_prop.to_i
    proposal = Proposal.new
    proposal.title = i.to_s+"-a title"
    proposal.description = "A proposal description"
    proposal.author = i.to_s+"An author"
    proposal.tag_list = tag.downcase
    proposal.save
  end
end

Given(/^there are (\d+) proposals with tag "(.*?)" and "(.*?)"$/) do |cant_prop, tag1, tag2|
  tag_list= tag1+" "+tag2
  for i in 0...cant_prop.to_i
    proposal = Proposal.new
    proposal.title = i.to_s+"-a title"
    proposal.description = "A proposal description"
    proposal.author = i.to_s+"An author"
    proposal.tag_list = tag_list.downcase
    proposal.save
  end
end

When(/^a revisor user visits reports page$/) do
  visit '/report/page'
end

When(/^selects proposals by tag report$/) do
  find('#tab-report-tag').click
end

When(/^selects tag "(.*?)"$/) do|tag|
  visit '/report/page'
  fill_in('consulta', :with => tag)
  click_button('buscar-tag')
end

Then(/^(\d+) proposals with tag "(.*?)" are listed$/) do |cantidad, tag|
  actual_order = page.all('tbody#results-tag tr').size
  expect(actual_order).to eq cantidad.to_i
  expect(page).to have_content(tag)
end

When(/^no tag is selected$/) do
  click_button('buscar-tag')
end

Then(/^(\d+) proposals are listed$/) do |cantidad|
  actual_order = page.all('tbody#results-tag tr').size
  expect(actual_order).to eq cantidad.to_i
end



