# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160609065249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"
  enable_extension "uuid-ossp"

  create_table "locations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "image_url"
    t.uuid     "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seed_migration_data_migrations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "user_profiles", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id",                 null: false
    t.jsonb    "data",       default: {}
    t.text     "picture"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.string   "gender"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "user_profiles", ["data"], name: "index_user_profiles_on_data", using: :gin
  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", unique: true, using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text     "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text     "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "system_admin",           default: false
    t.boolean  "active",                 default: true
    t.boolean  "receive_newsletter",     default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "version_associations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "version_id"
    t.string   "foreign_key_name", null: false
    t.uuid     "foreign_key_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "item_type",                    null: false
    t.uuid     "item_id",                      null: false
    t.string   "event",                        null: false
    t.string   "whodunnit"
    t.jsonb    "object"
    t.datetime "created_at"
    t.uuid     "item_owner_id"
    t.string   "item_owner_type"
    t.jsonb    "data",            default: {}
    t.jsonb    "object_changes"
    t.uuid     "transaction_id"
  end

  add_index "versions", ["item_owner_type", "item_owner_id"], name: "index_versions_on_item_owner_type_and_item_owner_id", using: :btree
  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "user_profiles", "users", on_update: :cascade, on_delete: :cascade
end
