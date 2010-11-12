# coding: utf-8

class CreateServiceInvoiceItems < ActiveRecord::Migration
  def self.up
    create_table :service_invoice_items do |t|
      t.integer :invoice_id
      t.decimal :price, :precision => 10, :scale => 5
      t.string :pricing_unit
      t.string :pricing_strategy, :default => 'hourly'
      t.string :currency, :default => '€'
      t.decimal :vat_rate, :precision => 10, :scale => 10, :default => 0.19
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
