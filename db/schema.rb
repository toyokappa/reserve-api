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

ActiveRecord::Schema[7.0].define(version: 2023_02_14_030640) do
  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.date "birthday"
    t.string "tel"
    t.string "postcode"
    t.string "address"
    t.string "image"
    t.string "id_card"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_customers_on_uid_and_provider", unique: true
  end

  create_table "guests", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "tel"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_guests_on_email"
    t.index ["tel"], name: "index_guests_on_tel"
  end

  create_table "payjp_customers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_payjp_customers_on_customer_id"
    t.index ["uid"], name: "index_payjp_customers_on_uid", unique: true
  end

  create_table "product_assigns", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "product_set_id", null: false
    t.bigint "product_item_id", null: false
    t.integer "price"
    t.integer "number_of_item"
    t.integer "days_of_expiration"
    t.boolean "is_main"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_item_id"], name: "index_product_assigns_on_product_item_id"
    t.index ["product_set_id"], name: "index_product_assigns_on_product_set_id"
  end

  create_table "product_items", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_sets", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "has_purchase_limit"
    t.integer "purchase_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "program_staffs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_staffs_on_program_id"
    t.index ["staff_id"], name: "index_program_staffs_on_staff_id"
  end

  create_table "programs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "required_time"
    t.string "description"
    t.integer "required_ticket"
    t.integer "publish_target"
    t.integer "use_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "scheduled_date"
    t.integer "required_time"
    t.bigint "program_id", null: false
    t.bigint "staff_id", null: false
    t.bigint "customer_id"
    t.bigint "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["program_id"], name: "index_reservations_on_program_id"
    t.index ["staff_id"], name: "index_reservations_on_staff_id"
  end

  create_table "shifts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.datetime "work_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id", "work_time"], name: "index_shifts_on_staff_id_and_work_time", unique: true
    t.index ["staff_id"], name: "index_shifts_on_staff_id"
    t.index ["work_time"], name: "index_shifts_on_work_time"
  end

  create_table "staffs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.string "image"
    t.string "email"
    t.string "comment"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_staffs_on_confirmation_token", unique: true
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_staffs_on_uid_and_provider", unique: true
  end

  create_table "tickets", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "product_set_id"
    t.bigint "reservation_id"
    t.string "name"
    t.datetime "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
    t.index ["product_set_id"], name: "index_tickets_on_product_set_id"
    t.index ["reservation_id"], name: "index_tickets_on_reservation_id"
  end

  add_foreign_key "payjp_customers", "customers"
  add_foreign_key "product_assigns", "product_items"
  add_foreign_key "product_assigns", "product_sets"
  add_foreign_key "program_staffs", "programs"
  add_foreign_key "program_staffs", "staffs"
  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "guests"
  add_foreign_key "reservations", "programs"
  add_foreign_key "reservations", "staffs"
  add_foreign_key "shifts", "staffs"
  add_foreign_key "tickets", "customers"
  add_foreign_key "tickets", "product_sets"
  add_foreign_key "tickets", "reservations"
end
