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

ActiveRecord::Schema.define(version: 2019_02_17_023218) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "telephone"
    t.string "email"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "radius"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_companies_on_latitude_and_longitude"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.integer "status"
    t.datetime "status_time"
    t.text "status_details"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_statuses_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "description"
    t.decimal "weight"
    t.decimal "length"
    t.decimal "width"
    t.decimal "heigth"
    t.string "pickup_address"
    t.float "pu_lat"
    t.float "pu_lng"
    t.datetime "pu_time"
    t.string "delivery_address"
    t.float "dy_lat"
    t.float "dy_lng"
    t.datetime "dy_time"
    t.decimal "cost"
    t.integer "status", default: 0
    t.integer "radius"
    t.integer "sender_id"
    t.integer "transporter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dy_lat", "dy_lng"], name: "index_orders_on_dy_lat_and_dy_lng"
    t.index ["pu_lat", "pu_lng"], name: "index_orders_on_pu_lat_and_pu_lng"
    t.index ["sender_id"], name: "index_orders_on_sender_id"
    t.index ["transporter_id"], name: "index_orders_on_transporter_id"
  end

  create_table "senders", force: :cascade do |t|
    t.string "name"
    t.string "telephone"
    t.string "email"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_senders_on_latitude_and_longitude"
  end

  create_table "transporters", force: :cascade do |t|
    t.string "name"
    t.string "telephone"
    t.string "email"
    t.integer "status", default: 1
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_transporters_on_company_id"
  end

end
