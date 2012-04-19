require 'rqrcode'

module Boh
  module QRCodes
    module Bin
      get '/bin' do
        haml :bin
      end

      post '/bin' do
        fname = params['key'][:tempfile].path
        params['key'][:tempfile].close

        key = File.binread(fname)
        raise "too long" if key.length > MAX_KEY_LENGTH
        @qr = RQRCode::QRCode.new(key, :size => QRCODE_SIZE, :level => QRCODE_LEVEL)

        haml :ascii_qrcode
      end
    end
  end
end