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

def body
  Nokogiri.parse last_response.body
end

def count_black_spots(key)
  @qr = RQRCode::QRCode.new(key, :size => 40, :level => :m) 
  page.all('td.black').count.should == @qr.to_s.count("x")
end
