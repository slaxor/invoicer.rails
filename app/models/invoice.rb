class Invoice < ActiveRecord::Base
  belongs_to :invoicing_party
  has_many :invoice_item_services
  validates_uniqueness_of :number
end
