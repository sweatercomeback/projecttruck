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

ActiveRecord::Schema.define(:version => 12) do

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_steps", :force => true do |t|
    t.integer  "project_id"
    t.text     "details"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.integer  "truck_id"
    t.integer  "photo_id"
    t.boolean  "public",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_log_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_logs", :force => true do |t|
    t.integer  "service_log_type_id"
    t.integer  "truck_id"
    t.string   "comments",            :limit => 4000
    t.integer  "mileage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "truck_attributes", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "truck_photos", :force => true do |t|
    t.integer  "truck_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trucks", :force => true do |t|
    t.string   "title"
    t.string   "model_other"
    t.integer  "year"
    t.integer  "mileage"
    t.text     "engine_comments"
    t.text     "drive_comments"
    t.text     "transmission_comments"
    t.integer  "doors"
    t.text     "ext_color_comments"
    t.text     "int_color_comments"
    t.text     "vehicle_condition_comments"
    t.boolean  "street_legal"
    t.text     "additional_comments"
    t.boolean  "public",                     :default => false
    t.float    "price"
    t.boolean  "for_sale",                   :default => false
    t.integer  "engine_id"
    t.integer  "drive_id"
    t.integer  "transmission_id"
    t.integer  "condition_id"
    t.integer  "model_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

end
