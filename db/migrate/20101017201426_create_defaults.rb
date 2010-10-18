class CreateDefaults < ActiveRecord::Migration
  def self.up
    create_table :defaults do |t|
      t.integer :customer_id
      t.string :currency, :default => '€'
      t.decimal :vat_rate, :precision => 10, :scale => 10, :default => 0.19
      t.decimal :price, :precision => 10, :scale => 6
      t.string :pricing_unit
      t.string :pricing_strategy
      t.string :due_on_calculation
      t.timestamps
    end
    remove_column :customers, :default_hourly_wage
    remove_column :customers, :default_currency
    remove_column :customers, :default_vat_rate
    add_column :invoices, :default_id, :integer
  end

  def self.down
    remove_column :invoices, :default_id
    add_column :customers, :default_vat_rate, :decimal,  :precision => 10, :scale => 10, :default => 0.19
    add_column :customers, :default_currency, :string, :default => '€'
    add_column :customers, :default_hourly_wage, :decimal
    drop_table :defaults
  end
end
