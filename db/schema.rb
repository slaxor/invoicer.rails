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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101010205748) do

  create_table "contacts", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "street"
    t.string   "post_code"
    t.string   "city"
    t.string   "country"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["customer_id"], :name => "fk_contacts_customer_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "user_id"
    t.decimal  "default_hourly_wage", :precision => 10, :scale => 10
    t.string   "default_currency",                                    :default => "\342\202\254"
    t.decimal  "default_vat_rate",    :precision => 10, :scale => 10, :default => 0.19
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["user_id"], :name => "fk_customers_user_id"

  create_table "invoice_item_services", :force => true do |t|
    t.integer  "invoice_id"
    t.decimal  "hourly_wage", :precision => 10, :scale => 5
    t.string   "currency"
    t.decimal  "vat",         :precision => 10, :scale => 10
    t.string   "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_item_services", ["invoice_id"], :name => "fk_invoice_item_services_invoice_id"

  create_table "invoices", :force => true do |t|
    t.integer  "contact_id",                            :null => false
    t.string   "number",                                :null => false
    t.text     "covering_text"
    t.integer  "invoicing_party_id",                    :null => false
    t.boolean  "paid",               :default => false
    t.date     "due_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["contact_id"], :name => "fk_invoices_contact_id"
  add_index "invoices", ["invoicing_party_id"], :name => "fk_invoices_invoicing_party_id"

  create_table "invoicing_parties", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "co_line"
    t.string   "street"
    t.string   "post_code"
    t.string   "city"
    t.string   "country"
    t.string   "vatid"
    t.string   "taxnumber"
    t.string   "currency"
    t.string   "bank"
    t.string   "bank_account_number"
    t.string   "bank_sort_code"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoicing_parties", ["user_id"], :name => "fk_invoicing_parties_user_id"

  create_table "pauses", :force => true do |t|
    t.integer  "invoice_item_service_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pauses", ["invoice_item_service_id"], :name => "fk_pauses_invoice_item_service_id"

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
