# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 15) do

  create_table "components", :force => true do |t|
    t.integer "product_id"
    t.integer "sys_config_id"
    t.integer "quantity"
  end

  create_table "mappings", :force => true do |t|
    t.integer "source_id"
    t.integer "destination_id"
    t.integer "migration_cost", :default => 0
    t.string  "name"
  end

  create_table "products", :force => true do |t|
    t.string  "type"
    t.string  "name"
    t.string  "manufacturer"
    t.integer "license"
    t.integer "support"
    t.boolean "oss",          :default => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "sys_configs", :force => true do |t|
    t.integer "system_id"
    t.string  "name"
    t.text    "description"
  end

  create_table "systems", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "status",          :default => 0
    t.string   "system_type"
    t.string   "sla"
    t.string   "internal"
    t.integer  "user_count"
    t.datetime "eol"
    t.string   "sys_admin_name"
    t.string   "sys_admin_phone"
    t.string   "sys_admin_email"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "role"
  end

end
