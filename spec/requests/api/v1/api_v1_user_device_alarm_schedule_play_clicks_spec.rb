require 'rails_helper'

RSpec.describe "Api::V1::UserDeviceAlarmSchedulePlayClicks", type: :request do
  describe "GET /api_v1_user_device_alarm_schedule_play_clicks" do
    it "works! (now write some real specs)" do
      get api_v1_user_device_alarm_schedule_play_clicks_path
      expect(response).to have_http_status(200)
    end
  end
end
