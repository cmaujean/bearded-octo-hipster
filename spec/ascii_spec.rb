require 'spec_helper'

describe "GET /ascii", :type => :request do

  before do
    visit '/ascii'
  end

  it "has a textarea named 'qrcode'" do
    within "form" do
      page.should have_xpath("//textarea[@name='qrcode']")
    end
  end

  it "has a submit button" do
    within "form #submit" do
      page.should have_xpath("//input[@type='submit']")
    end
  end

end
