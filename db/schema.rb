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

ActiveRecord::Schema.define(version: 2020_04_23_125259) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appoiments", force: :cascade do |t|
    t.date "date"
    t.time "timing"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appoiments_on_doctor_id"
    t.index ["patient_id"], name: "index_appoiments_on_patient_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "available_from_1"
    t.time "available_from_2"
    t.time "available_from_3"
    t.time "available_from_4"
    t.time "available_from_5"
    t.time "available_from_6"
    t.time "available_from_7"
    t.time "available_to_1"
    t.time "available_to_2"
    t.time "available_to_3"
    t.time "available_to_4"
    t.time "available_to_5"
    t.time "available_to_6"
    t.time "available_to_7"
    t.index ["doctor_id"], name: "index_availabilities_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.text "name"
    t.text "degrees"
    t.text "specialization"
    t.integer "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.boolean "authorized", default: false
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.integer "contact_number"
    t.text "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "medical_stores", force: :cascade do |t|
    t.text "city"
    t.text "name"
    t.integer "contact_number"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "medicine_stocks", force: :cascade do |t|
    t.text "name"
    t.integer "quantity"
    t.integer "medical_store_id"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sender_id"
    t.integer "receiver_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "message"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "medical_store_id"
    t.integer "quantity"
    t.string "name"
    t.integer "price"
    t.integer "total"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "medicine_stock_id"
    t.integer "quantity"
    t.integer "patient_id"
    t.integer "medical_store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pathology_labs", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.boolean "authorized"
    t.integer "contact_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_pathology_labs_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.text "name"
    t.date "birthday"
    t.integer "gender"
    t.integer "contact_number"
    t.text "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "prescription_medicines", force: :cascade do |t|
    t.string "medicine"
    t.integer "quantity"
    t.integer "prescription_id"
    t.index ["prescription_id"], name: "index_prescription_medicines_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "disease"
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "status"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_requests_on_doctor_id"
    t.index ["patient_id"], name: "index_requests_on_patient_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "select_months", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appoiments", "doctors"
  add_foreign_key "appoiments", "patients"
  add_foreign_key "availabilities", "doctors"
  add_foreign_key "notifications", "users"
  add_foreign_key "prescriptions", "doctors"
  add_foreign_key "prescriptions", "patients"
  add_foreign_key "requests", "doctors"
  add_foreign_key "requests", "patients"
end
