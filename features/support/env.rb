require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")
require 'data_mapper'
require 'capybara/cucumber'
require 'rspec'
require 'rspec/expectations'
#include Capybara::DSL

# Data base in memory
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_migrate!

#Capybara.default_driver = :selenium
Capybara.app = Tod::App.tap { |app|  }

require_relative '../../app/models/proposal'