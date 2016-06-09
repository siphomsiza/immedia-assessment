# This migration comes from seed_migration (originally 20140310150145)
class CreateDataMigrations < ActiveRecord::Migration
  def up
    create_table SeedMigration.migration_table_name, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :version
      t.integer :runtime
      t.datetime :migrated_on
    end
  end

  def down
    drop_table SeedMigration.migration_table_name
  end
end
