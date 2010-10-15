class ServiceInvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  has_many :pauses, :dependent => :delete_all

  def hours
    ended_at - started_at
  end

  def gross_price
    price + price * vat
  end

  def pricing
    case pricing_strategy
    when 'fixed'
      price
    else
      raise 'ImplementationWorkToDo'
    end
  end

  def pause_times
    pauses.map(&:to_time).join(', ')
  end
end
