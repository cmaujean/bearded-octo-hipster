require 'spec_helper'


describe "GET /bin", :type => :request do

  context "http request" do
    before do
      get '/bin'
    end
    it "should be success" do
      last_response.status.should == 200
      last_response.status.should_not == 500
    end

  end
  context "page returns" do
    before do
      visit '/bin'
    end
    it "provides a file upload element" do
      page.should have_selector('input[type="file"]')
    end

    it "provides a submit button" do
      page.should have_selector('input[type="submit"]')
    end
  end
end

describe 'POST /bin', :type => :request do
  before do
    visit '/bin'
    attach_file "key", test_file
    click_on "Generate"
  end

  it "returns a table" do
    page.should have_selector("table")
  end

  it "returns a valid QR code" do
    count_black_spots(File.binread(test_file))
  end
end

