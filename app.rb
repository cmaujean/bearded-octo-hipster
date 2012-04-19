require 'bundler/setup'
require 'sinatra'
require 'rqrcode'

require_relative 'lib/config'

Dir.glob(File.join(File.dirname(__FILE__), "lib", "**", "*.rb")).each do |lib|
  puts "requiring #{lib}" if development? or test?
  require_relative lib
end

set :public_folder, File.dirname(__FILE__) + '/public'

include Boh::QRCodes::Ascii
include Boh::QRCodes::Bin


