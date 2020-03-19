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

ActiveRecord::Schema.define(version: 20200319080147) do

  create_table "restaurants", force: :cascade do |t|
    t.integer  "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "city"
    t.index ["users_id"], name: "index_restaurants_on_users_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "restaurants_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "is_breakfast_included"
    t.string   "breakfast_item"
    t.decimal  "breakfast_price"
    t.boolean  "is_lunch_included"
    t.string   "lunch_item"
    t.decimal  "lunch_price"
    t.boolean  "is_dinner_included"
    t.string   "dinner_item"
    t.decimal  "dinner_price"
    t.boolean  "is_veg"
    t.boolean  "is_nonVeg"
    t.integer  "users_id"
    t.index ["restaurants_id"], name: "index_subscriptions_on_restaurants_id"
    t.index ["users_id"], name: "index_subscriptions_on_users_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "address"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.integer  "pincode"
    t.boolean  "is_chef"
    t.string   "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
