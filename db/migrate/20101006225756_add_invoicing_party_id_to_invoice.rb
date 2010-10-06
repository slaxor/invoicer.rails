class AddInvoicingPartyIdToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :invoicing_party_id, :integer
  end

  def self.down
    remove_column :invoices, :invoicing_party_id
  end
end
