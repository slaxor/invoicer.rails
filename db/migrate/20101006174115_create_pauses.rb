class CreatePauses < ActiveRecord::Migration
  def self.up
    create_table :pauses do |t|
      t.integer :invoice_item_service_id
      t.datetime :started_at
      t.datetime :ended_at
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :pauses
  end
end
