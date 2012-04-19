require 'spec_helper'

describe 'PGP Server API' do

  def pgp_key
    %Q{ some great key source }
  end

  # "http://pgp.mit.edu:11371/pks/add"
  # assuming MIT server is the only one we're aware of ATM
  describe 'GET /key/:id' do

    it "successfully retrieves the GPG key from the server" do
      get '/key/A1B2C3D4'

      last_response.status.should == 200
    end

  end

  describe 'POST /keys' do
    it "should post" do
      post '/keys', :key_id => 'A1B2C3D4', :content => pgp_key

      last_response.status.should == 200
    end
  end

  # TODO: more REST
  # describe 'GET /keys' # don't get all of the keys on the server
  # describe 'POST /keys' # send your key to the server
  # describe 'PUT /key/:id' # update your key on the server
  # describe 'DELETE /key/:id' # delete your key from the server


end
