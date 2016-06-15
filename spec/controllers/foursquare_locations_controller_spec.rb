require 'rails_helper'

RSpec.describe FoursquareLocationsController, :type => :controller do

  describe "GET request_location" do
    it "returns http success" do
      get :request_location
      expect(response).to be_success
    end
  end

end
