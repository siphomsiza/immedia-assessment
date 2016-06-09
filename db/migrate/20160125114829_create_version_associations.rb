class CreateVersionAssociations < ActiveRecord::Migration
  def self.up
    create_table :version_associations, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid   :version_id
      t.string :foreign_key_name, :null => false
      t.uuid   :foreign_key_id

      t.timestamps
    end
    add_index :version_associations, [:version_id]
    add_index :version_associations, [:foreign_key_name, :foreign_key_id], :name => 'index_version_associations_on_foreign_key'

  end

  def self.down
    remove_index :version_associations, [:version_id]
    remove_index :version_associations, :name => 'index_version_associations_on_foreign_key'
    drop_table :version_associations
  end
end
