# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_02_05_061749) do

  create_table "aecsites", force: :cascade do |t|
    t.string "lecture"
    t.string "professor"
    t.float "reputation"
    t.text "grade"
    t.text "reportage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname"
    t.string "age"
    t.string "birthday"
    t.string "hometown"
    t.string "college"
    t.text "character"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tchcourcelists", force: :cascade do |t|
    t.string "lecture"
    t.string "professor"
    t.float "reputation"
    t.text "grade"
    t.text "reportage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "tlcources", force: :cascade do |t|
    t.string "lecture"
    t.string "professor"
    t.float "reputation"
    t.text "grade"
    t.text "reportage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "universitylives", force: :cascade do |t|
    t.text "selsect"
    t.text "study"
    t.text "parttimejob"
    t.text "circle"
    t.text "daily"
    t.text "intern"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_universitylives_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "universitylives", "users"
end
