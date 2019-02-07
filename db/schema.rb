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

ActiveRecord::Schema.define(version: 2019_02_07_082249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.string "name"
    t.integer "seatconfig_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show", default: true
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flight_id"
    t.text "pnr"
    t.integer "price", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirm", default: false
  end

  create_table "phlights", force: :cascade do |t|
    t.integer "airplane_id"
    t.integer "seatconfig_id"
    t.string "origin"
    t.string "destination"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seatcats", force: :cascade do |t|
    t.string "name"
    t.integer "row"
    t.integer "column"
    t.integer "baseprice"
    t.bigint "seatconfig_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "aisle"
    t.index ["seatconfig_id"], name: "index_seatcats_on_seatconfig_id"
  end

  create_table "seatconfigs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show", default: true
  end

  create_table "seats", force: :cascade do |t|
    t.string "pnr"
    t.string "position", default: "middle"
    t.boolean "available", default: true
    t.boolean "emergency", default: false
    t.bigint "seatcat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "break"
    t.integer "number"
    t.integer "booking_id"
    t.index ["seatcat_id"], name: "index_seats_on_seatcat_id"
  end

  create_table "tempseats", force: :cascade do |t|
    t.integer "price"
    t.text "pnr"
    t.integer "seat_id"
    t.boolean "emergency"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.index ["booking_id"], name: "index_tempseats_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "seatcats", "seatconfigs"
  add_foreign_key "seats", "seatcats"
  add_foreign_key "tempseats", "bookings"
end
