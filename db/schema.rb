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

ActiveRecord::Schema[7.0].define(version: 2023_03_18_043238) do
  create_table "body_metrics_logs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "staff_id"
    t.bigint "reservation_id"
    t.string "photo"
    t.datetime "logged_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_body_metrics_logs_on_customer_id"
    t.index ["reservation_id"], name: "index_body_metrics_logs_on_reservation_id"
    t.index ["staff_id"], name: "index_body_metrics_logs_on_staff_id"
  end

  create_table "coupons", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "discount_amount"
    t.datetime "expiration"
    t.integer "use_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_coupons_on_code", unique: true
  end

  create_table "customer_coupons", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "coupon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_customer_coupons_on_coupon_id"
    t.index ["customer_id"], name: "index_customer_coupons_on_customer_id"
  end

  create_table "customer_group_customers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "customer_group_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_group_id"], name: "index_customer_group_customers_on_customer_group_id"
    t.index ["customer_id"], name: "index_customer_group_customers_on_customer_id"
  end

  create_table "customer_group_product_sets", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "customer_group_id", null: false
    t.bigint "product_set_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_group_id"], name: "index_customer_group_product_sets_on_customer_group_id"
    t.index ["product_set_id"], name: "index_customer_group_product_sets_on_product_set_id"
  end

  create_table "customer_groups", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "product_set_coupons", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "product_set_id", null: false
    t.bigint "coupon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_product_set_coupons_on_coupon_id"
    t.index ["product_set_id"], name: "index_product_set_coupons_on_product_set_id"
  end

  create_table "product_sets", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "has_purchase_limit"
    t.integer "purchase_limit"
    t.integer "publish_state", default: 1
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

  create_table "purchase_details", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "product_name"
    t.integer "amount"
    t.bigint "purchase_history_id", null: false
    t.bigint "product_assign_id"
    t.json "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coupon_id"
    t.index ["coupon_id"], name: "index_purchase_details_on_coupon_id"
    t.index ["product_assign_id"], name: "index_purchase_details_on_product_assign_id"
    t.index ["purchase_history_id"], name: "index_purchase_details_on_purchase_history_id"
  end

  create_table "purchase_histories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "product_set_name"
    t.integer "total_amount"
    t.integer "payment_method"
    t.datetime "purchased_at"
    t.string "card_number"
    t.string "card_brand"
    t.string "card_expiration"
    t.string "card_owner"
    t.string "payjp_charge_uid"
    t.string "payjp_card_uid"
    t.bigint "product_set_id"
    t.bigint "customer_id"
    t.json "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coupon_id"
    t.index ["coupon_id"], name: "index_purchase_histories_on_coupon_id"
    t.index ["customer_id"], name: "index_purchase_histories_on_customer_id"
    t.index ["product_set_id"], name: "index_purchase_histories_on_product_set_id"
  end

  create_table "reservations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "scheduled_at"
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
    t.string "comment", default: ""
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frequency", default: 5, null: false
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

  create_table "training_logs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "staff_id"
    t.bigint "reservation_id"
    t.string "photo"
    t.datetime "logged_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_training_logs_on_customer_id"
    t.index ["reservation_id"], name: "index_training_logs_on_reservation_id"
    t.index ["staff_id"], name: "index_training_logs_on_staff_id"
  end

  add_foreign_key "body_metrics_logs", "customers"
  add_foreign_key "body_metrics_logs", "staffs"
  add_foreign_key "customer_coupons", "coupons"
  add_foreign_key "customer_coupons", "customers"
  add_foreign_key "customer_group_customers", "customer_groups"
  add_foreign_key "customer_group_customers", "customers"
  add_foreign_key "customer_group_product_sets", "customer_groups"
  add_foreign_key "customer_group_product_sets", "product_sets"
  add_foreign_key "payjp_customers", "customers"
  add_foreign_key "product_assigns", "product_items"
  add_foreign_key "product_assigns", "product_sets"
  add_foreign_key "product_set_coupons", "coupons"
  add_foreign_key "product_set_coupons", "product_sets"
  add_foreign_key "program_staffs", "programs"
  add_foreign_key "program_staffs", "staffs"
  add_foreign_key "purchase_details", "coupons"
  add_foreign_key "purchase_details", "product_assigns"
  add_foreign_key "purchase_details", "purchase_histories"
  add_foreign_key "purchase_histories", "coupons"
  add_foreign_key "purchase_histories", "customers"
  add_foreign_key "purchase_histories", "product_sets"
  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "guests"
  add_foreign_key "reservations", "programs"
  add_foreign_key "reservations", "staffs"
  add_foreign_key "shifts", "staffs"
  add_foreign_key "tickets", "customers"
  add_foreign_key "tickets", "product_sets"
  add_foreign_key "tickets", "reservations"
  add_foreign_key "training_logs", "customers"
  add_foreign_key "training_logs", "staffs"
end
