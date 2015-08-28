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

ActiveRecord::Schema.define(version: 20150828140831) do

  create_table "bubble_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "bubble_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bubbles", force: :cascade do |t|
    t.string   "bubble_name"
    t.string   "bubble_topics"
    t.integer  "bubble_creator_id"
    t.integer  "bubble_votes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "comment_text"
    t.string   "comment_media"
    t.integer  "comment_score"
    t.datetime "comment_created"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bubble_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "post_text"
    t.string   "post_media"
    t.integer  "post_score"
    t.string   "post_topics"
    t.string   "post_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "realname"
    t.string   "email"
    t.string   "phone"
    t.integer  "user_score"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "password_hash"
  end

end
