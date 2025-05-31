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

ActiveRecord::Schema[8.0].define(version: 2024_12_13_063038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "age_range_bills", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.bigint "age_range_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_range_id"], name: "index_age_range_bills_on_age_range_id"
    t.index ["bill_id"], name: "index_age_range_bills_on_bill_id"
  end

  create_table "age_ranges", force: :cascade do |t|
    t.string "age_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string "doc_no"
    t.datetime "doc_date"
    t.float "total_price", default: 0.0
    t.integer "total_amount", default: 0
    t.float "discount", default: 0.0
    t.float "get_paid", default: 0.0
    t.float "change", default: 0.0
    t.bigint "member_id"
    t.bigint "reservation_id"
    t.bigint "status_master_id", null: false
    t.string "customer_name"
    t.bigint "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_bills_on_member_id"
    t.index ["reservation_id"], name: "index_bills_on_reservation_id"
    t.index ["status_master_id"], name: "index_bills_on_status_master_id"
    t.index ["table_id"], name: "index_bills_on_table_id"
  end

  create_table "gender_bills", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.bigint "gender_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_gender_bills_on_bill_id"
    t.index ["gender_id"], name: "index_gender_bills_on_gender_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer "cid"
    t.string "name"
    t.datetime "expired"
    t.bigint "status_master_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_master_id"], name: "index_members_on_status_master_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "amount"
    t.float "unit_price"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.string "doc_no"
    t.datetime "doc_date"
    t.float "total_price", default: 0.0
    t.integer "total_amount", default: 0
    t.bigint "staff_id", null: false
    t.bigint "status_master_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_orders_on_bill_id"
    t.index ["staff_id"], name: "index_orders_on_staff_id"
    t.index ["status_master_id"], name: "index_orders_on_status_master_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "product_category_id", null: false
    t.string "description"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.bigint "table_id", null: false
    t.string "customer_name"
    t.datetime "reservation_date"
    t.bigint "status_master_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_reservations_on_staff_id"
    t.index ["status_master_id"], name: "index_reservations_on_status_master_id"
    t.index ["table_id"], name: "index_reservations_on_table_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.bigint "status_master_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_master_id"], name: "index_tables_on_status_master_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "age_range_bills", "age_ranges"
  add_foreign_key "age_range_bills", "bills"
  add_foreign_key "bills", "members"
  add_foreign_key "bills", "reservations"
  add_foreign_key "bills", "status_masters"
  add_foreign_key "bills", "tables"
  add_foreign_key "gender_bills", "bills"
  add_foreign_key "gender_bills", "genders"
  add_foreign_key "members", "status_masters"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "bills"
  add_foreign_key "orders", "staffs"
  add_foreign_key "orders", "status_masters"
  add_foreign_key "products", "product_categories"
  add_foreign_key "reservations", "staffs"
  add_foreign_key "reservations", "status_masters"
  add_foreign_key "reservations", "tables"
  add_foreign_key "tables", "status_masters"
end
