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

ActiveRecord::Schema.define(version: 20180326082614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest"
    t.string "name", null: false
    t.string "nik"
    t.string "phone"
    t.string "email"
    t.text "address"
    t.string "position"
    t.integer "role", null: false
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_admins_on_name"
    t.index ["username"], name: "index_admins_on_username"
    t.index ["village_id"], name: "index_admins_on_village_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "picture"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_articles_on_admin_id"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "medical_facilities", force: :cascade do |t|
    t.string "name", null: false
    t.string "facility_type"
    t.text "address"
    t.string "phone"
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_medical_facilities_on_name"
    t.index ["village_id"], name: "index_medical_facilities_on_village_id"
  end

  create_table "medical_personnels", force: :cascade do |t|
    t.string "name", null: false
    t.string "position"
    t.string "phone"
    t.string "agency"
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_medical_personnels_on_name"
    t.index ["village_id"], name: "index_medical_personnels_on_village_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", null: false
    t.text "address"
    t.string "phone"
    t.string "pob"
    t.date "dob"
    t.string "gender"
    t.string "blood_type"
    t.string "picture"
    t.text "description"
    t.string "disease_type"
    t.integer "status", null: false
    t.bigint "village_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_patients_on_name"
    t.index ["user_id"], name: "index_patients_on_user_id"
    t.index ["village_id"], name: "index_patients_on_village_id"
  end

  create_table "residents", force: :cascade do |t|
    t.date "input_date", null: false
    t.integer "input_type", null: false
    t.string "disease_type"
    t.integer "total", default: 0, null: false
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["input_date"], name: "index_residents_on_input_date"
    t.index ["village_id"], name: "index_residents_on_village_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone", null: false
    t.string "name", null: false
    t.string "gender"
    t.text "address"
    t.string "nik"
    t.string "email"
    t.string "user_job"
    t.string "picture"
    t.integer "role", null: false
    t.integer "otp"
    t.bigint "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["village_id"], name: "index_users_on_village_id"
  end

  create_table "villages", force: :cascade do |t|
    t.string "name"
    t.string "kecamatan"
    t.string "kabupaten"
    t.string "provinsi"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admins", "villages"
  add_foreign_key "articles", "admins"
  add_foreign_key "medical_facilities", "villages"
  add_foreign_key "medical_personnels", "villages"
  add_foreign_key "patients", "users"
  add_foreign_key "patients", "villages"
  add_foreign_key "residents", "villages"
  add_foreign_key "users", "villages"
end
