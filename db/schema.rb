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

ActiveRecord::Schema.define(version: 2022_05_24_233557) do

  create_table "active_storage_attachments", charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "latin1", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "configurations", primary_key: "id_configurations", id: :integer, charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.string "sizer_ip", limit: 15
    t.string "sizer_status", limit: 100
    t.timestamp "create_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "update_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "endpoints", charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "functs", charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "outlets", primary_key: "id_outlet", id: :integer, charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.integer "id_outlet_sz"
    t.string "outlet_name", limit: 20
    t.string "product_name", limit: 20
    t.string "product_display_name", limit: 20
    t.string "pack_name", limit: 50
    t.float "pack_weight_kg"
    t.integer "outlet_fpm"
    t.string "outlet_status", limit: 30
    t.boolean "visible"
    t.timestamp "create_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "update_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "screens", charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.string "ip"
    t.integer "screen_channel"
    t.integer "cant_screen"
    t.integer "outlets_id_0", default: 99, null: false
    t.integer "outlets_id_1", default: 99, null: false
    t.integer "outlets_id_2", default: 99, null: false
    t.integer "outlets_id_3", default: 99, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "servers", charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.string "ip"
    t.string "desc"
    t.integer "status"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "temp_data", primary_key: "id_temp_data", charset: "latin1", force: :cascade do |t|
    t.integer "id_device", null: false
    t.string "location", limit: 10, null: false
    t.string "temp", limit: 5, null: false
    t.string "unit", limit: 2, null: false
    t.datetime "create_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "temp_devices", charset: "latin1", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "latin1", force: :cascade do |t|
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

  create_table "weight_data", primary_key: "id_weight_data", charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.integer "id_device", null: false
    t.string "outlet_name", limit: 4, null: false
    t.string "weight", limit: 5
    t.string "unit", limit: 2, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "weight_devices", primary_key: "id_device", id: :integer, charset: "utf8", collation: "utf8_spanish2_ci", force: :cascade do |t|
    t.string "mac_address", limit: 17, null: false
    t.string "ip_address", limit: 15, null: false
    t.string "outlet_name", limit: 23, default: "Dispositivo no asignado"
    t.string "firmware", limit: 10, null: false
    t.integer "heartbeat", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "wialot_data", primary_key: "id_data", charset: "latin1", force: :cascade do |t|
    t.integer "id_device", null: false
    t.integer "device_type", null: false
    t.string "location_site", limit: 10, null: false
    t.string "measure", limit: 6, null: false
    t.integer "unit", null: false
    t.datetime "create_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "wialot_devices", primary_key: "id_device", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "device_type", null: false
    t.string "mac_address", limit: 17, null: false
    t.string "ip_address", limit: 15, null: false
    t.string "location_site", limit: 10, default: "99"
    t.string "firmware", limit: 10, null: false
    t.integer "heartbeat"
    t.datetime "create_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
