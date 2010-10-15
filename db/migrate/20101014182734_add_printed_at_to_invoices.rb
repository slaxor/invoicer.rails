class AddPrintedAtToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :printed_at, :datetime
  end

  def self.down
    remove_column :invoices, :printed_at
  end
end
