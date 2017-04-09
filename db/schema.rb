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

ActiveRecord::Schema.define(version: 20170409062114) do

  create_table "header1s", force: :cascade do |t|
    t.string   "data"
    t.integer  "welcome_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["welcome_id"], name: "index_header1s_on_welcome_id"
  end

  create_table "header2s", force: :cascade do |t|
    t.string   "data"
    t.integer  "welcome_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["welcome_id"], name: "index_header2s_on_welcome_id"
  end

  create_table "header3s", force: :cascade do |t|
    t.string   "data"
    t.integer  "welcome_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["welcome_id"], name: "index_header3s_on_welcome_id"
  end

  create_table "link_urls", force: :cascade do |t|
    t.string   "data"
    t.integer  "welcome_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["welcome_id"], name: "index_link_urls_on_welcome_id"
  end

  create_table "welcomes", force: :cascade do |t|
    t.string   "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
