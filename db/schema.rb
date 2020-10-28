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

ActiveRecord::Schema.define(version: 2020_10_28_160314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cart_orders", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_orders_on_cart_id"
    t.index ["order_id"], name: "index_cart_orders_on_order_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "sessionid"
    t.bigint "location_product_id", null: false
    t.decimal "price"
    t.integer "quantity"
    t.integer "quantity_delivered"
    t.decimal "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "isordered"
    t.index ["location_product_id"], name: "index_carts_on_location_product_id"
  end

  create_table "location_inventories", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.integer "quantity_available"
    t.decimal "cost"
    t.decimal "selling_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_location_inventories_on_location_id"
    t.index ["product_id"], name: "index_location_inventories_on_product_id"
  end

  create_table "location_products", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.integer "quantity_available"
    t.decimal "average_cost"
    t.decimal "price"
    t.decimal "discount"
    t.string "uom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_location_products_on_location_id"
    t.index ["product_id"], name: "index_location_products_on_product_id"
  end

  create_table "location_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "description"
    t.string "address"
    t.bigint "location_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_type_id"], name: "index_locations_on_location_type_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "order_status_id", null: false
    t.datetime "order_date"
    t.decimal "total_amount"
    t.decimal "discount_amount"
    t.decimal "grand_total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "code"
    t.string "sku"
    t.decimal "price"
    t.integer "quantity"
    t.string "uom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_orders", "carts"
  add_foreign_key "cart_orders", "orders"
  add_foreign_key "carts", "location_products"
  add_foreign_key "location_inventories", "locations"
  add_foreign_key "location_inventories", "products"
  add_foreign_key "location_products", "locations"
  add_foreign_key "location_products", "products"
  add_foreign_key "locations", "location_types"
  add_foreign_key "orders", "order_statuses"
end
