class Invoice < ActiveRecord::Base
  belongs_to :invoicing_party
  belongs_to :customer
  has_many :invoice_item_services
  validates_uniqueness_of :number


  def set_default_number
    self.number = "#{Date.today.year}#{Date.today.month}"
  end
end
