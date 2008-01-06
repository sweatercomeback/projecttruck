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

ActiveRecord::Schema.define(:version => 33) do

  create_table "coming_soons", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "from_user_id"
    t.boolean  "unread",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nav_links", :force => true do |t|
    t.string   "name",            :default => "", :null => false
    t.string   "link_controller", :default => "", :null => false
    t.string   "link_action"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.string   "summary"
    t.text     "article"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string  "content_type"
    t.string  "filename"
    t.integer "size"
    t.integer "parent_id"
    t.string  "thumbnail"
    t.integer "width"
    t.integer "height"
    t.integer "db_file_id"
    t.integer "user_id"
  end

  create_table "photos_projects", :force => true do |t|
    t.integer "photo_id"
    t.integer "project_id"
  end

  create_table "photos_vehicles", :force => true do |t|
    t.integer "photo_id"
    t.integer "vehicle_id"
  end

  create_table "project_steps", :force => true do |t|
    t.integer "project_id"
    t.string  "text"
    t.integer "photo_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.integer  "vehicle_id"
    t.integer  "project_photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_log_types", :force => true do |t|
    t.string "name"
  end

  create_table "service_logs", :force => true do |t|
    t.integer  "service_log_type_id"
    t.integer  "vehicle_id"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mileage"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "email"
    t.string   "salt"
    t.datetime "created_at"
    t.float    "lat"
    t.float    "lng"
    t.datetime "last_activity_date"
  end

  create_table "vehicle_attributes", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
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
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipcode"
    t.string   "city"
    t.float    "price"
    t.boolean  "for_sale"
    t.integer  "model_id"
    t.integer  "engine_id"
    t.integer  "drive_id"
    t.integer  "transmission_id"
    t.integer  "vehicle_condition_id"
    t.integer  "user_id"
    t.float    "lat"
    t.float    "lng"
  end

end
