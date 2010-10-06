class Customer < ActiveRecord::Base
  has_many :contacts
  has_many :invoices
  validates_uniqueness_of :name, :customer_number
end
