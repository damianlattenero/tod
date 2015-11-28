Given(/^uploaded file is "([^"]*)"$/) do |arg1|
  @filename = arg1.to_s
  page.attach_file('proposal[file]', Dir.pwd + '/features/step_definitions/' + arg1)
end

Then(/^file is attached$/) do
  expect(Proposal.all[0].file.url.to_s.include? @filename).to be_truthy
end
