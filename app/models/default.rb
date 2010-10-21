class Default < ActiveRecord::Base
  belongs_to :customer
  has_many :invoices
  attr_protected :customer_id
end


