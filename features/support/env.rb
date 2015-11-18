require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")
require 'data_mapper'
require 'capybara/cucumber'
require 'rspec'
require 'rspec/expectations'
#include Capybara::DSL
require 'rubygems'
require 'dm-core'
require 'dm-tags'
# Data base in memory
DataMapper.auto_migrate!

# Capybara.default_driver    = :webkit
# Capybara.current_driver    = :webkit
Capybara.javascript_driver = :webkit

Capybara.app = Tod::App.tap { |app|  }
Capybara.default_wait_time = 5

require_relative '../../app/models/proposal'

# Clear test database after each escenario
After do
  Proposal.destroy!
  Comment.destroy!
  User.destroy!
  Evaluation.destroy!
end

