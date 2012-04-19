require 'sinatra'

get '/key/:id/?' do
  haml 'keys/show'
end

post '/keys/?' do
  # send key to pgp.mit.edu
end
