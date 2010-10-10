class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :customer_id
      t.string :name
      t.string :email
      t.string :telephone
      t.string :street
      t.string :post_code
      t.string :city
      t.string :country
      t.string :kind
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
