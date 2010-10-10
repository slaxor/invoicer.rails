class CreateInvoiceItemServices < ActiveRecord::Migration
  def self.up
    create_table :invoice_item_services do |t|
      t.integer :invoice_id
      t.decimal :hourly_wage
      t.decimal :vat
      t.string :description
      t.datetime :started_at
      t.datetime :ended_at
      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_item_services
  end
end
