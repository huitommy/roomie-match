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

ActiveRecord::Schema.define(version: 20160410152424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dwellings", force: :cascade do |t|
    t.string  "address",                   null: false
    t.string  "city",                      null: false
    t.string  "state",                     null: false
    t.string  "zip_code",                  null: false
    t.string  "type",                      null: false
    t.integer "bedrooms",                  null: false
    t.float   "bathrooms",                 null: false
    t.integer "sq_ft",                     null: false
    t.integer "rent",                      null: false
    t.boolean "parking",   default: false
  end

  create_table "preferences", force: :cascade do |t|
    t.boolean "pets",        default: false
    t.integer "smoking",                     null: false
    t.integer "drinking",                    null: false
    t.integer "music",                       null: false
    t.integer "vegetarian",                  null: false
    t.integer "cleanliness",                 null: false
    t.integer "parties",                     null: false
    t.integer "sports",                      null: false
    t.integer "user_id",                     null: false
    t.integer "dwelling_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "gender",                              null: false
    t.date     "date_of_birth",                       null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
