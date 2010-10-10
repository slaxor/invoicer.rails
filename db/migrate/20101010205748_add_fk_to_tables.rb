require 'migration_helpers'
class AddFkToTables < ActiveRecord::Migration
  extend MigrationHelpers
  def self.up
    add_foreign_key(:invoice_item_services, :invoice_id, :invoices)
    add_foreign_key(:invoices, :customer_id, :customers)
    add_foreign_key(:invoices, :contact_id, :contacts)
    add_foreign_key(:invoices, :invoicing_party_id, :invoicing_parties)
    add_foreign_key(:pauses, :invoice_item_service_id, :invoice_item_services)
    add_foreign_key(:invoicing_parties, :user_id, :users)
    add_foreign_key(:contacts, :customer_id, :customers)
    add_foreign_key(:customers, :user_id, :users)
  end

  def self.down
    remove_foreign_key(:invoice_item_services, :invoice_id)
    remove_foreign_key(:invoices, :customer_id)
    remove_foreign_key(:invoices, :contact_id)
    remove_foreign_key(:invoices, :invoicing_party_id)
    remove_foreign_key(:pauses, :invoice_item_service_id)
    remove_foreign_key(:invoicing_parties, :user_id)
    remove_foreign_key(:contacts, :customer_id)
    remove_foreign_key(:customers, :user_id)
  end
end
