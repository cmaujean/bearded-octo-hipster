require 'rqrcode'

module Boh
  module QRCodes
    module Ascii

      get '/ascii' do
        haml :ascii_index
      end

      post '/ascii' do
        raise "too long" if params[:qrcode].length > MAX_KEY_LENGTH
        @qr = RQRCode::QRCode.new(params[:qrcode], :size => QRCODE_SIZE, :level => QRCODE_LEVEL)

        haml :ascii_qrcode
      end
    end
  end
end