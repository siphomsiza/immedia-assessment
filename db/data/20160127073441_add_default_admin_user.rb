class AddDefaultAdminUser < SeedMigration::Migration
  def up
    User.delete_all
    object = User.new(Settings.SYSTEM_ADMIN_DATA.to_hash)
    object.password_confirmation = Settings.SYSTEM_ADMIN_DATA.password
    object.system_admin = true
    object.try(:skip_confirmation!)
    object.user_profile.attributes = Settings.SYSTEM_ADMIN_PROFILE_DATA.to_hash
    object.user_profile.is_nested = true
    object.save!
    puts ['id', 'firstname', 'lastname', 'email', 'active', 'password'].map{|x| {x => object.send(x)}}
    puts "Is System Admin? => #{object.system_admin?}"
  end

  def down
    User.delete_all
  end
end
