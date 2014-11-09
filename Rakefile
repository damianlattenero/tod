require 'bundler/setup'
require 'padrino-core/cli/rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

PadrinoTasks.use(:database)
PadrinoTasks.use(:datamapper)
PadrinoTasks.init

task :default => :spec
