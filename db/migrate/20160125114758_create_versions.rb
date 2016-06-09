class CreateVersions < ActiveRecord::Migration

  # The largest text column available in all supported RDBMS is
  # 1024^3 - 1 bytes, roughly one gibibyte.  We specify a size
  # so that MySQL will use `longtext` instead of `text`.  Otherwise,
  # when serializing very large objects, `text` might not be big enough.
  TEXT_BYTES = 1_073_741_823
  TEXT_BYTES = 1_073_741_823

  def change
    create_table :versions , id: :uuid, default: "uuid_generate_v4()"do |t|
      t.string   :item_type, null:  false
      t.uuid     :item_id,   null:  false
      t.string   :event,     null:  false
      t.string   :whodunnit
      t.jsonb    :object#,    :limit => TEXT_BYTES
      t.datetime :created_at
      t.uuid     :item_owner_id
      t.string   :item_owner_type
      t.jsonb     :data, null: true, default: {}
      t.jsonb    :object_changes#, limit: TEXT_BYTES
      t.uuid     :transaction_id

    end
    add_index :versions, [:item_type, :item_id]
    add_index :versions, [:item_owner_type, :item_owner_id]
    add_index :versions, [:transaction_id]
  end
end
