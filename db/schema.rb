# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101006225756) do

  create_table "contacts", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "street"
    t.string   "post_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.integer  "customer_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_item_services", :force => true do |t|
    t.integer  "invoice_id"
    t.decimal  "hourly_wage"
    t.decimal  "vat"
    t.string   "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "number"
    t.integer  "contact_id"
    t.boolean  "paid"
    t.date     "due_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoicing_party_id"
  end

  create_table "invoicing_parties", :force => true do |t|
    t.string   "name"
    t.string   "co_line"
    t.string   "street"
    t.string   "post_code"
    t.string   "city"
    t.string   "vatid"
    t.string   "taxnumber"
    t.string   "currency"
    t.string   "bank"
    t.string   "bank_account_number"
    t.string   "bank_sort_code"
    t.string   "country"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pauses", :force => true do |t|
    t.integer  "invoice_item_service_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
