require 'rails_helper'

RSpec.describe AccountMembershipInvitationsController, type: :controller do

  describe "GET #choose" do
    it "returns http success" do
      get :choose
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #accept" do
    it "returns http success" do
      get :accept
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #decline" do
    it "returns http success" do
      get :decline
      expect(response).to have_http_status(:success)
    end
  end

end
