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

ActiveRecord::Schema.define(:version => 20131027055320) do

  create_table "associations", :force => true do |t|
    t.integer  "game_room_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "associations", ["game_room_id"], :name => "index_associations_on_game_room_id"
  add_index "associations", ["user_id"], :name => "index_associations_on_user_id"

  create_table "boards", :force => true do |t|
    t.integer  "size"
    t.integer  "player_count"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "game_room_id"
  end

  add_index "boards", ["game_room_id"], :name => "index_boards_on_game_room_id"
  add_index "boards", ["user_id"], :name => "index_boards_on_user_id"

  create_table "game_rooms", :force => true do |t|
    t.string   "name"
    t.integer  "maxplayers"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ships", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.integer  "size"
    t.boolean  "vertical"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "board_id"
    t.boolean  "placed"
    t.integer  "user_id"
  end

  add_index "ships", ["board_id"], :name => "index_ships_on_board_id"
  add_index "ships", ["user_id"], :name => "index_ships_on_user_id"

  create_table "shots", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.boolean  "hit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "board_id"
  end

  add_index "shots", ["board_id"], :name => "index_shots_on_board_id"
  add_index "shots", ["user_id"], :name => "index_shots_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.integer  "board_id"
  end

  add_index "users", ["board_id"], :name => "index_users_on_board_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
