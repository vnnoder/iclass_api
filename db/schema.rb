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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130501025726) do

  create_table "questions", :force => true do |t|
    t.string  "title"
    t.string  "detail"
    t.integer "user_id"
    t.integer "session_id"
    t.string  "created_at", :null => false
    t.string  "updated_at", :null => false
  end

  add_index "questions", ["session_id"], :name => "index_questions_on_session_id"
  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sessions", ["user_id"], :name => "index_sessions_on_user_id"

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "password"
    t.date   "created_at", :null => false
    t.date   "updated_at", :null => false
    t.string "name"
  end

end
