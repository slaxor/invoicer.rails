class CreateServiceInvoiceItems < ActiveRecord::Migration
  def self.up
    create_table :service_invoice_items do |t|
      t.integer :invoice_id
      t.decimal :hourly_wage, :precision => 10, :scale => 5
      t.string :currency
      t.decimal :vat_rate, :precision => 10, :scale => 10
      t.string :description
      t.datetime :started_at
      t.datetime :ended_at
      t.timestamps
    end
  end

  def self.down
    drop_table :service_invoice_items
  end
end
