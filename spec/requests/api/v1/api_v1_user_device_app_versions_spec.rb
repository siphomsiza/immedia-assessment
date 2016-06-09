require 'rails_helper'

RSpec.describe "Api::V1::UserDeviceAppVersions", type: :request do
  describe "GET /api_v1_user_device_app_versions" do
    it "works! (now write some real specs)" do
      get api_v1_user_device_app_versions_path
      expect(response).to have_http_status(200)
    end
  end
end
