class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :customer_id
      t.integer :number
      t.integer :contact_id
      t.boolean :paid
      t.date :due_on

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
