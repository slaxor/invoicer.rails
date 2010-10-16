class Invoice < ActiveRecord::Base
  belongs_to :invoicing_party
  belongs_to :contact
  has_many :service_invoice_items, :dependent => :delete_all
  validates_uniqueness_of :number, :scope => :invoicing_party_id

  def customer
    contact.customer
  end

  def set_default_number
    self.number = format('%s-%s%0.3i', customer.number, Time.now.to_s(:month_stamp), self.class.count(:conditions => {:contact_id => contact_id}))
  end

  def hours
    service_invoice_items.map(&:hours).sum
  end

  def amount
    service_invoice_items.map(&:amount).sum
  end

  def vat_amount
    service_invoice_items.map(&:vat_amount).sum
  end

  def gross_amount
    service_invoice_items.map(&:gross_amount).sum
  end
end
