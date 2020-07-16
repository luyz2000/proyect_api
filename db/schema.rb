# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_16_053157) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "activity_logs", force: :cascade do |t|
    t.integer "baby_id", null: false
    t.integer "assistant_id", null: false
    t.integer "activity_id", null: false
    t.datetime "start_time"
    t.datetime "stop_time"
    t.string "duration"
    t.string "name"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_activity_logs_on_activity_id"
    t.index ["assistant_id"], name: "index_activity_logs_on_assistant_id"
    t.index ["baby_id"], name: "index_activity_logs_on_baby_id"
  end

  create_table "assistants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "babies", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "mother_name"
    t.string "father_name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "image"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "activity_logs", "activities"
  add_foreign_key "activity_logs", "assistants"
  add_foreign_key "activity_logs", "babies"
end
