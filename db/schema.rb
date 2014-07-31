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

ActiveRecord::Schema.define(version: 20140731212812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "a_url"
    t.text     "body"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "subheader"
    t.integer  "post_id"
    t.text     "header"
    t.boolean  "received?"
  end

  create_table "follows", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.text     "raw_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "host"
    t.string   "email"
    t.string   "full"
    t.string   "name"
    t.text     "raw_text"
    t.text     "raw_html"
    t.text     "attachments"
    t.string   "a_url"
  end

  create_table "saved_articles", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.boolean  "is_archived?"
    t.boolean  "is_favorited?"
    t.string   "tag_one"
    t.string   "tag_two"
    t.string   "tag_three"
    t.string   "tag_four"
    t.string   "tag_five"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.boolean  "is_private?"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
  end

end
