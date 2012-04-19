require File.expand_path(File.join(File.dirname(__FILE__), '..', 'app'))
require 'capybara/rspec'
require 'rack/test'
require 'nokogiri'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end
