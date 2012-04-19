require 'sinatra'
require 'rqrcode'

Dir['./lib/**/*.rb'].each {|path| require path }

get '/' do
  haml :index
end

post '/' do
  haml :qrcode
end
