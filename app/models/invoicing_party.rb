class InvoicingParty < ActiveRecord::Base
  belongs_to :user
  has_many :invoices
  attr_protected :user_id
end
