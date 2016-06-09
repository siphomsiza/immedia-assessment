class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :user_id, null:false
      t.jsonb :data, default: '{}'
      t.text :picture
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :gender
      t.timestamps null: false
    end

    add_index :user_profiles, :user_id, unique: true
    add_index :user_profiles, :data, using: :gin

    add_foreign_key :user_profiles, :users, on_delete: :cascade, on_update: :cascade, column: :user_id

  end
end
