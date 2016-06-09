class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.text :description
      t.text :image_url
      t.uuid :user_id, null:false
      t.timestamps null: false
    end
  end
end
