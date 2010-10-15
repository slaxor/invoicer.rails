class Contact < ActiveRecord::Base
  belongs_to :customer
  has_many :invoices
end
