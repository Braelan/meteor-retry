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

ActiveRecord::Schema.define(version: 20160206172742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "uid",        null: false
    t.string   "provider",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "authentications", ["provider"], name: "index_authentications_on_provider", using: :btree
  add_index "authentications", ["uid"], name: "index_authentications_on_uid", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "front"
    t.string   "front_img"
    t.string   "back"
    t.string   "back_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "recipients", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipients", ["post_id"], name: "index_recipients_on_post_id", using: :btree
  add_index "recipients", ["user_id"], name: "index_recipients_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "email"
    t.string   "password_digest",    null: false
    t.string   "session_token",      null: false
    t.string   "status"
    t.string   "uid"
    t.string   "provider"
    t.string   "image_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "zodiac"
    t.string   "myers_briggs"
    t.string   "crystal"
    t.string   "potion"
    t.string   "nsa_status"
    t.string   "happiness"
    t.string   "skills"
    t.string   "concentrations"
    t.string   "gender"
    t.date     "birthday"
    t.string   "favorite_food"
    t.string   "favorite_island"
    t.integer  "ski_size"
    t.string   "state"
    t.integer  "shoe_size"
    t.integer  "pant_size"
    t.integer  "shirt_size"
    t.string   "myers_brigg"
    t.string   "credit_score"
    t.string   "hair_color"
    t.string   "eye_color"
    t.boolean  "forehead_wrinkles"
    t.boolean  "marital_status"
    t.string   "sexual_orientation"
  end

  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "xusers", force: :cascade do |t|
    t.string  "zodiac"
    t.string  "myers_briggs"
    t.string  "crystal"
    t.string  "potion"
    t.string  "nsa_status"
    t.string  "happiness"
    t.string  "skills"
    t.string  "concentrations"
    t.string  "gender"
    t.date    "birthday"
    t.string  "favorite_food"
    t.string  "favorite_island"
    t.integer "ski_size"
    t.string  "state"
    t.integer "shoe_size"
    t.integer "pant_size"
    t.integer "shirt_size"
    t.string  "myers_brigg"
    t.string  "credit_score"
    t.string  "hair_color"
    t.string  "eye_color"
    t.boolean "forehead_wrinkles"
    t.boolean "marital_status"
    t.string  "sexual_orientation"
    t.integer "user_id"
  end

end
