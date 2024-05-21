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

ActiveRecord::Schema[7.0].define(version: 2024_05_21_071516) do
  create_table "diseases", charset: "utf8", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "disease_name", null: false
    t.datetime "date_of_onset", null: false
    t.integer "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_diseases_on_patient_id"
  end

  create_table "patients", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "patient_name", null: false
    t.integer "sex_id", null: false
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "symptoms", charset: "utf8", force: :cascade do |t|
    t.bigint "disease_id", null: false
    t.string "symptoms", null: false
    t.datetime "time", null: false
    t.integer "level_id", null: false
    t.text "treatment"
    t.text "evaluation"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_symptoms_on_disease_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diseases", "patients"
  add_foreign_key "patients", "users"
  add_foreign_key "symptoms", "diseases"
end
