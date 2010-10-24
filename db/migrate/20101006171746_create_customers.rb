class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :number
      t.integer :user_id
      t.string :email
      t.string :telephone
      t.string :street
      t.string :post_code
      t.string :city
      t.string :country
    t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
