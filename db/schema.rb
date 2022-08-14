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

ActiveRecord::Schema.define(version: 2022_08_12_015939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "description"
    t.string "zip_code"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliver_has_adresses", force: :cascade do |t|
    t.bigint "deliver_id"
    t.bigint "adress_id"
    t.string "type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adress_id"], name: "index_deliver_has_adresses_on_adress_id"
    t.index ["deliver_id"], name: "index_deliver_has_adresses_on_deliver_id"
  end

  create_table "deliver_has_products", force: :cascade do |t|
    t.bigint "deliver_id"
    t.bigint "product_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deliver_id"], name: "index_deliver_has_products_on_deliver_id"
    t.index ["product_id"], name: "index_deliver_has_products_on_product_id"
  end

  create_table "delivers", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "truck_id"
    t.string "payload_type"
    t.integer "total_items"
    t.float "total_billing"
    t.datetime "delivery_date"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "employee_code"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "unit"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.string "board_number"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
