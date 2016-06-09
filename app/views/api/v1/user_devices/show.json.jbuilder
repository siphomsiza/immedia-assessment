if @user_device.errors.empty?
  json.extract! @user_device, :id, :user_id, :model, :uuid, :version, :platform, :manufacturer, :serial, :is_virtual, :data, :app_created_at, :app_updated_at, :created_at, :updated_at
else
  json.errors  @user_device.errors
end
