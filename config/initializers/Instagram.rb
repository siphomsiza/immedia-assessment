require "instagram"
Instagram.configure do |config|
  config.client_id = Settings.instagram_client_id
  config.access_token = Settings.instagram_access_token
end
