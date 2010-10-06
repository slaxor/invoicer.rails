class InvoiceItemService < ActiveRecord::Base
  belongs_to :invoice_item
  has_many :pauses
end
