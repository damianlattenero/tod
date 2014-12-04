require 'thor'
require 'padrino-core/cli/rake'

RACK_ENV = ENV['RACK_ENV'] ||= 'test' unless defined?(RACK_ENV)

PadrinoTasks.use(:database)
PadrinoTasks.use(:datamapper)
PadrinoTasks.init

if ['development', 'test'].include?(RACK_ENV)

  require 'bundler/setup'
  require 'rspec/core/rake_task'
  require 'cucumber/rake/task'

  RSpec::Core::RakeTask.new
  Cucumber::Rake::Task.new

  task :default => [:spec, :cucumber]

end
