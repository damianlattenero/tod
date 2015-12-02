Given(/^uploaded file is "([^"]*)"$/) do |arg1|
  @filename = arg1.to_s
  page.attach_file('proposal[file]', Dir.pwd + '/features/step_definitions/' + arg1)
end

Then(/^file is attached$/) do
  expect(Proposal.all[0].file.exists?).to be_truthy
end

Given(/^user decides no uploadding file$/) do
  #The user no choose file
end

Then(/^there is no file attached$/) do
  expect(Proposal.all[0].file.exists?).to be_falsey
end