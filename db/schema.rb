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

ActiveRecord::Schema.define(version: 2018_08_30_162953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "user_order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 0
    t.index ["product_id"], name: "index_carts_on_product_id"
    t.index ["user_order_id"], name: "index_carts_on_user_order_id"
  end

  create_table "delivery_methods", force: :cascade do |t|
    t.string "name", null: false
    t.money "price", scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "details"
    t.string "size"
    t.money "price", scale: 2, null: false
  end

  create_table "user_orders", force: :cascade do |t|
    t.string "session_id"
    t.bigint "delivery_method_id"
    t.datetime "date_order_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_method_id"], name: "index_user_orders_on_delivery_method_id"
  end

  add_foreign_key "carts", "products"
  add_foreign_key "carts", "user_orders"
  add_foreign_key "user_orders", "delivery_methods"
end
