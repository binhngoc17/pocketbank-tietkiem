# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140530132702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", force: true do |t|
    t.string   "reward_point"
    t.boolean  "reward_card"
    t.float    "cash_back_rate"
    t.float    "finance_charge_per_year"
    t.float    "advance_fee_at_ATM"
    t.integer  "interest_free_day"
    t.string   "credit_limit"
    t.integer  "expiry_period"
    t.string   "late_charge"
    t.float    "cash_advance_fee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "cash_back_rate_description"
  end

  add_index "credits", ["cash_back_rate"], name: "index_credits_on_cash_back_rate", using: :btree

  create_table "debits", force: true do |t|
    t.integer  "internal_transaction_fee"
    t.string   "internal_transaction_fee_description"
    t.integer  "external_transaction_fee"
    t.string   "external_transaction_fee_description"
    t.integer  "daily_withdrawal_limit",               limit: 8
    t.integer  "withdrawal_limit",                     limit: 8
    t.integer  "daily_expense_limit",                  limit: 8
    t.integer  "expense_limit",                        limit: 8
    t.integer  "daily_transaction_limit",              limit: 8
    t.integer  "transaction_limit",                    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "debits", ["withdrawal_limit"], name: "index_debits_on_withdrawal_limit", using: :btree

  create_table "products", force: true do |t|
    t.integer  "as_product_id"
    t.string   "as_product_type"
    t.integer  "provider_id"
    t.text     "image"
    t.text     "link"
    t.string   "name"
    t.boolean  "recommended"
    t.boolean  "has_promotion"
    t.text     "description"
    t.integer  "primary_card_annual_fee",                           limit: 8
    t.integer  "sub_card_annual_fee",                               limit: 8
    t.integer  "issuance_fee",                                      limit: 8
    t.integer  "domestic_internal_cash_withdrawal_fee",             limit: 8
    t.string   "domestic_internal_cash_withdrawal_fee_description"
    t.integer  "domestic_external_cash_withdrawal_fee",             limit: 8
    t.string   "domestic_external_cash_withdrawal_fee_description"
    t.integer  "oversea_internal_cash_withdrawal_fee",              limit: 8
    t.string   "oversea_internal_cash_withdrawal_fee_description"
    t.integer  "oversea_external_cash_withdrawal_fee",              limit: 8
    t.string   "oversea_external_cash_withdrawal_fee_description"
    t.float    "currency_exchange_fee"
    t.text     "issuance_condition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brand"
    t.string   "card_rank"
    t.string   "currency_exchange_fee_desc"
  end

  add_index "products", ["currency_exchange_fee"], name: "index_products_on_currency_exchange_fee", using: :btree
  add_index "products", ["has_promotion"], name: "index_products_on_has_promotion", using: :btree
  add_index "products", ["primary_card_annual_fee"], name: "index_products_on_primary_card_annual_fee", using: :btree
  add_index "products", ["provider_id"], name: "index_products_on_provider_id", using: :btree
  add_index "products", ["recommended"], name: "index_products_on_recommended", using: :btree
  add_index "products", ["sub_card_annual_fee"], name: "index_products_on_sub_card_annual_fee", using: :btree

  create_table "providers", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
    t.string   "avatar"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "phone"
    t.integer  "province_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
