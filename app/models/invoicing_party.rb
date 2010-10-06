class InvoicingParty < ActiveRecord::Base
  has_many :invoices
end
