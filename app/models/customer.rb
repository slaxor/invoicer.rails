class Customer < ActiveRecord::Base
  has_many :contacts
  has_many :invoices
  validates_uniqueness_of :name
  validates_uniqueness_of :number #TODO Scoping user-modell oder so
end
