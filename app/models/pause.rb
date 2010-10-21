class Pause < ActiveRecord::Base
  belongs_to :service_invoice_item
  attr_protected :service_invoice_item_id

  def to_s
    "#{started_at.to_s(:time)} - #{ended_at.to_s(:time)}"
  end

  def length
    (ended_at - started_at) / 3600
  end
end
