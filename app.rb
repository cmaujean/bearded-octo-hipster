require 'bundler/setup'
require 'sinatra'
require 'rqrcode'

set :public_folder, File.dirname(__FILE__) + '/public'

MAX_KEY_LENGTH = 4096
QRCODE_SIZE = 40
QRCODE_LEVEL = :m

get '/ascii' do
  haml :ascii_index
end

post '/ascii' do
  qrcode = params[:qrcode]
  raise "too long" if qrcode.length > MAX_KEY_LENGTH

  @qr = RQRCode::QRCode.new(qrcode, :size => QRCODE_SIZE, :level => QRCODE_LEVEL)

  haml :ascii_qrcode
end
