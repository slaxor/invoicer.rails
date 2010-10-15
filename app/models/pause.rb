class Pause < ActiveRecord::Base
  belongs_to :service_invoice_item
  def to_time
    "#{started_at.to_s(:time)} - #{ended_at.to_s(:time)}"
  end
end
