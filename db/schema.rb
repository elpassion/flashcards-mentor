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

ActiveRecord::Schema.define(version: 20151125182721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "deck_id",                         null: false
    t.text     "front"
    t.text     "back"
    t.integer  "position",            default: 1, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "remembered_by_count", default: 0, null: false
  end

  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "decks_count", default: 0, null: false
  end

  create_table "deck_categories", force: :cascade do |t|
    t.integer  "deck_id",     null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "deck_categories", ["category_id"], name: "index_deck_categories_on_category_id", using: :btree
  add_index "deck_categories", ["deck_id", "category_id"], name: "index_deck_categories_on_deck_id_and_category_id", unique: true, using: :btree
  add_index "deck_categories", ["deck_id"], name: "index_deck_categories_on_deck_id", using: :btree

  create_table "decks", force: :cascade do |t|
    t.integer  "author_id",                          null: false
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cards_count",            default: 0, null: false
    t.integer  "subscribed_users_count", default: 0, null: false
    t.integer  "categories_count",       default: 0, null: false
  end

  add_index "decks", ["author_id"], name: "index_decks_on_author_id", using: :btree

  create_table "repetitions", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "card_id",                    null: false
    t.datetime "due"
    t.boolean  "repeat",     default: false, null: false
    t.float    "e_factor"
    t.integer  "interval"
    t.integer  "iteration"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "repetitions", ["card_id"], name: "index_repetitions_on_card_id", using: :btree
  add_index "repetitions", ["user_id", "card_id"], name: "index_repetitions_on_user_id_and_card_id", unique: true, using: :btree
  add_index "repetitions", ["user_id"], name: "index_repetitions_on_user_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "deck_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["deck_id"], name: "index_subscriptions_on_deck_id", using: :btree
  add_index "subscriptions", ["user_id", "deck_id"], name: "index_subscriptions_on_user_id_and_deck_id", unique: true, using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "authored_decks_count",   default: 0, null: false
    t.integer  "subscribed_decks_count", default: 0, null: false
    t.integer  "remembered_cards_count", default: 0, null: false
  end

  add_foreign_key "cards", "decks"
  add_foreign_key "deck_categories", "categories"
  add_foreign_key "deck_categories", "decks"
  add_foreign_key "decks", "users", column: "author_id"
  add_foreign_key "repetitions", "cards"
  add_foreign_key "repetitions", "users"
  add_foreign_key "subscriptions", "decks"
  add_foreign_key "subscriptions", "users"
end
