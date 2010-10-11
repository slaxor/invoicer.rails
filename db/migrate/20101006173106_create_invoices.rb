class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :contact_id, :null => false
      t.string :number, :null => false
      t.text :covering_text
      t.integer :contact_id, :null => false
      t.integer :invoicing_party_id, :null => false
      t.boolean :paid, :default => false
      t.date :due_on
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
