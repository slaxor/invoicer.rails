class CreateInvoicingParties < ActiveRecord::Migration
  def self.up
    create_table :invoicing_parties do |t|
      t.string :name
      t.integer :user_id
      t.string :co_line
      t.string :street
      t.string :post_code
      t.string :city
      t.string :country
      t.string :vatid
      t.string :taxnumber
      t.string :currency
      t.string :bank
      t.string :bank_account_number
      t.string :bank_sort_code
      t.string :country
      t.string :telephone
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :invoicing_parties
  end
end
