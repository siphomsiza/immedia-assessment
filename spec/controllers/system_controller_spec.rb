require 'rails_helper'

RSpec.describe SystemController, type: :controller do

  describe "GET #about_us" do
    it "returns http success" do
      get :about_us
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #privacy_policy" do
    it "returns http success" do
      get :privacy_policy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #terms_of_use" do
    it "returns http success" do
      get :terms_of_use
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contact_us" do
    it "returns http success" do
      get :contact_us
      expect(response).to have_http_status(:success)
    end
  end

end
