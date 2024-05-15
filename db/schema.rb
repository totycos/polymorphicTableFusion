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

ActiveRecord::Schema[7.0].define(version: 2024_05_15_203131) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_products", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.decimal "balance", precision: 10, scale: 2
    t.string "status"
    t.string "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_company_products_on_category_id"
    t.index ["company_id"], name: "index_company_products_on_company_id"
    t.index ["product_id"], name: "index_company_products_on_product_id"
  end

  create_table "investments", force: :cascade do |t|
    t.string "investor_type", null: false
    t.integer "investor_id", null: false
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.decimal "balance", precision: 10, scale: 2
    t.string "status"
    t.string "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_investments_on_category_id"
    t.index ["investor_type", "investor_id"], name: "index_investments_on_investor"
    t.index ["product_id"], name: "index_investments_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_products", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.decimal "balance", precision: 10, scale: 2
    t.string "status"
    t.string "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_products_on_category_id"
    t.index ["product_id"], name: "index_user_products_on_product_id"
    t.index ["user_id"], name: "index_user_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "company_products", "categories"
  add_foreign_key "company_products", "companies"
  add_foreign_key "company_products", "products"
  add_foreign_key "investments", "categories"
  add_foreign_key "investments", "products"
  add_foreign_key "user_products", "categories"
  add_foreign_key "user_products", "products"
  add_foreign_key "user_products", "users"
end
