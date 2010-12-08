class ServiceInvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  has_many :pauses, :dependent => :delete_all, :autosave => true
  attr_protected :invoice_id
  scope :default,  :order => :started_at
  def hours
    (ended_at - started_at) / 3600 - pause_length
  end

  def amount
    case pricing_strategy
    when 'fixed'
      price
    when 'hourly'
      price * hours
    else
      raise 'ImplementationWorkToDo'
    end
  end

  def vat_amount
    amount * vat_rate
  end

  def gross_amount
    amount + vat_amount
  end

  def pause_times
    pauses.map(&:to_s).join(', ')
  end

  def pause_length
    pauses.map(&:length).sum
  end
end
