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

ActiveRecord::Schema.define(version: 20160728171621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.float    "yield"
    t.float    "price"
    t.integer  "calorie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchasing_orders", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchasings", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "recipeitems", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "item_id"
    t.integer  "amount"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipeitems", ["item_id"], name: "index_recipeitems_on_item_id", using: :btree
  add_index "recipeitems", ["recipe_id"], name: "index_recipeitems_on_recipe_id", using: :btree

  create_table "recipepos", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "purchasing_order_id"
    t.integer  "production"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "recipepos", ["purchasing_order_id"], name: "index_recipepos_on_purchasing_order_id", using: :btree
  add_index "recipepos", ["recipe_id"], name: "index_recipepos_on_recipe_id", using: :btree

  create_table "recipepurchasings", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "purchasing_id"
    t.integer  "production"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recipepurchasings", ["purchasing_id"], name: "index_recipepurchasings_on_purchasing_id", using: :btree
  add_index "recipepurchasings", ["recipe_id"], name: "index_recipepurchasings_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fname"
    t.string   "lname"
    t.string   "companyname"
    t.string   "companywebsite"
    t.string   "img_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "recipeitems", "items"
  add_foreign_key "recipeitems", "recipes"
  add_foreign_key "recipepos", "purchasing_orders"
  add_foreign_key "recipepos", "recipes"
  add_foreign_key "recipepurchasings", "purchasings"
  add_foreign_key "recipepurchasings", "recipes"
end
