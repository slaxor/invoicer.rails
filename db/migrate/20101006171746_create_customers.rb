class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :number
      t.integer :user_id
      t.decimal :default_hourly_wage, :precision => 10, :scale => 10
      t.string :default_currency, :default => '€'
      t.decimal :default_vat_rate, :precision => 10, :scale => 10, :default => 0.19
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
