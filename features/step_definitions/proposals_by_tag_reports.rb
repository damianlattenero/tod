Given(/^a revisor user$/) do
  @revisor= User.new
  @revisor.name= "Un nombre"
  @revisor.email= "revisor@tod.com"
  @revisor.email= "revisor"
  @revisor.save
  visit 'proposal/new'
end

Given(/^there are (\d+) proposals with tag "([^"]*)" only$/) do |cant_prop, tag|
  for i in 1..cant_prop.to_i
    fill_in 'proposal[title]', :with => i.to_s+"-a title"
    fill_in 'proposal[author]', :with => i.to_s+"-a author"
    fill_in('proposal[tags_list]', :with => tag)
    click_button('Enviar')
  end
end

Given(/^there are (\d+) proposals with tag "(.*?)" and "(.*?)"$/) do |cant_prop, tag1, tag2|
  tag_list= tag1+" "+tag2
  for i in 0...cant_prop.to_i
    fill_in 'proposal[title]', :with => i.to_s+"-a title"
    fill_in 'proposal[author]', :with => i.to_s+"-a author"
    fill_in('proposal[tags_list]', :with =>tag_list)
    click_button('Enviar')
  end
end

When(/^a revisor user visits reports page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^selects proposals by tag report$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^selects tag "(.*?)"$/) do|arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^(\d+) proposals with tag "(.*?)" are listed$/) do |arg1,arg2|
  pending # express the regexp above with the code you wish you had
end


When(/^no tag is selected$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^(\d+) proposals are listed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end



