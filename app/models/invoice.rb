class Invoice < ActiveRecord::Base
  belongs_to :invoicing_party
  belongs_to :contact
  has_many :service_invoice_items, :dependent => :delete_all
  validates_uniqueness_of :number, :scope => :invoicing_party

  def customer
    contact.customer
  end

  def set_default_number
    self.number = "#{Date.today.year}#{Date.today.month}#{count(:conditions => {:contact_id => contact_id})}"
  end

  def price
    service_invoice_items.sum
  end

  def gross_price
  end
end
