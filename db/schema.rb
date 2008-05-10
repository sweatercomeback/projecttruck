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

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "parent_id",    :default => 0
    t.string   "content_type", :default => "NULL"
    t.string   "filename",     :default => "NULL"
    t.string   "thumbnail",    :default => "NULL"
    t.integer  "size",         :default => 0
    t.integer  "width",        :default => 0
    t.integer  "height",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_steps", :force => true do |t|
    t.integer  "project_id", :default => 0
    t.text     "details",    :default => "NULL"
    t.integer  "photo_id",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title",      :default => "NULL"
    t.integer  "truck_id",   :default => 0
    t.integer  "photo_id",   :default => 0
    t.boolean  "public",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename",   :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_log_types", :force => true do |t|
    t.string   "name",       :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_logs", :force => true do |t|
    t.integer  "service_log_type_id",                 :default => 0
    t.integer  "truck_id",                            :default => 0
    t.string   "comments",            :limit => 4000, :default => "NULL"
    t.integer  "mileage",                             :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "truck_attributes", :force => true do |t|
    t.string   "type",       :default => "NULL"
    t.string   "name",       :default => "NULL"
    t.integer  "parent_id",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "truck_photos", :force => true do |t|
    t.integer  "truck_id",   :default => 0
    t.integer  "photo_id",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trucks", :force => true do |t|
    t.string   "title",                                    :default => "NULL"
    t.string   "model_other",                              :default => "NULL"
    t.integer  "year",                                     :default => 0
    t.integer  "mileage",                                  :default => 0
    t.text     "engine_comments",                          :default => "NULL"
    t.text     "drive_comments",                           :default => "NULL"
    t.text     "transmission_comments",                    :default => "NULL"
    t.integer  "doors",                                    :default => 0
    t.text     "ext_color_comments",                       :default => "NULL"
    t.text     "int_color_comments",                       :default => "NULL"
    t.text     "vehicle_condition_comments",               :default => "NULL"
    t.boolean  "street_legal",                             :default => false
    t.text     "additional_comments",                      :default => "NULL"
    t.boolean  "public",                                   :default => false
    t.float    "price",                                    :default => 0.0
    t.boolean  "for_sale",                                 :default => false
    t.integer  "engine_id",                                :default => 0
    t.integer  "drive_id",                                 :default => 0
    t.integer  "transmission_id",                          :default => 0
    t.integer  "condition_id",                             :default => 0
    t.integer  "model_id",                                 :default => 0
    t.integer  "user_id",                                  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ext_color_id"
    t.integer  "int_color_id"
    t.float    "lat",                        :limit => 25
    t.float    "lng",                        :limit => 25
    t.string   "zip"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                   :default => "NULL"
    t.string   "email",                                   :default => "NULL"
    t.string   "crypted_password",          :limit => 40, :default => "NULL"
    t.string   "salt",                      :limit => 40, :default => "NULL"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",                          :default => "NULL"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40, :default => "NULL"
    t.datetime "activated_at"
  end

end
