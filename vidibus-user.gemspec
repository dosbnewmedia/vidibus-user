# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'vidibus/user/version'

Gem::Specification.new do |s|
  s.name        = 'vidibus-user'
  s.version     = Vidibus::User::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'André Pankratz'
  s.email       = 'andre@webwarelab.com'
  s.homepage    = 'https://github.com/vidibus/vidibus-user'
  s.summary     = 'User library for authentication'
  s.description = 'Provides a user model and tools to authenticate the current user.'
  s.license     = 'MIT'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'vidibus-user'

  s.add_dependency 'mongoid'
  s.add_dependency 'warden'
  s.add_dependency 'oauth2', '>= 0.9.2'
  s.add_dependency 'vidibus-uuid'
  s.add_dependency 'vidibus-service'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rr'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rack'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'database_cleaner'

  s.files = Dir.glob('{lib,app,config}/**/*') + %w[README.md Rakefile]
  s.require_path = 'lib'
end
