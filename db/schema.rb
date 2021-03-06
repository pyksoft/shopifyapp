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

ActiveRecord::Schema.define(version: 20170928194957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customizations", force: :cascade do |t|
    t.string "color_background"
    t.string "color_border"
    t.string "color_text"
    t.string "color_highlight"
    t.string "color_hover"
    t.string "text_apt_suite"
    t.string "text_inaccurate"
    t.string "text_select_confirm"
    t.string "text_select_suggestion"
    t.string "text_suggest1"
    t.text "text_suggest2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text_correct"
    t.integer "option_id"
  end

  create_table "options", force: :cascade do |t|
    t.boolean "auto_complete"
    t.boolean "validate_address"
    t.boolean "pobox_warning"
    t.boolean "streetnum_warning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

end
