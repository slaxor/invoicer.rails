class ServiceInvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  has_many :pauses

  def hours
    ended_at - started_at
  end

  def price
    hours * hourly_wage
  end

  def gross_price
    price + price * vat
  end
end
