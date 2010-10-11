class Invoice < ActiveRecord::Base
  belongs_to :invoicing_party
  belongs_to :contact
  has_many :service_invoice_items
  validates_uniqueness_of :number

  def customer
    contact.customer
  end

  def set_default_number
    self.number = "#{Date.today.year}#{Date.today.month}"
  end

  def price
    service_invoice_items.sum
  end

  def gross_price
  end
end
