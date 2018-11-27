require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$:.unshift File.expand_path('../../', __FILE__)

require 'rubygems'
require 'active_support'
require 'active_support/core_ext'
require 'rack'
require 'rspec'
require 'rr'
require 'mongoid'
require 'webmock/rspec'
require 'ostruct'
require "database_cleaner"

require 'vidibus-user'
require 'app/models/user'
Dir["#{File.dirname(__FILE__)}/../spec/support/**/*.rb"].each {|f| require f}

Mongoid.configure do |config|
  config.connect_to('vidibus-user_test')
end

Mongo::Logger.logger.level = Logger::INFO

RSpec.configure do |config|

  config.include WebMock::API
  config.mock_with :rr

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
