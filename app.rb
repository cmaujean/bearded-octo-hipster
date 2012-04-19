require 'sinatra'
require 'rqrcode'

get '/' do
  haml :index
end

post '/' do
  haml :qrcode
end
