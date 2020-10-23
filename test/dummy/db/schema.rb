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

ActiveRecord::Schema.define(version: 2015_06_02_210254) do

  create_table "stackview_call_numbers", force: :cascade do |t|
    t.string "sort_key", null: false
    t.string "sort_key_display"
    t.string "sort_key_type", null: false
    t.string "system_id", null: false
    t.string "title", null: false
    t.string "creator"
    t.string "format"
    t.integer "measurement_page_numeric"
    t.integer "measurement_height_numeric"
    t.integer "shelfrank"
    t.string "pub_date"
    t.datetime "created_at"
    t.index ["sort_key"], name: "index_stackview_call_numbers_on_sort_key"
    t.index ["system_id"], name: "index_stackview_call_numbers_on_system_id"
  end

end
