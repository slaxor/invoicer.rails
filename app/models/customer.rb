class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, :dependent => :delete_all
  has_many :defaults, :dependent => :delete_all
  validates_uniqueness_of :name
  validates_uniqueness_of :number, :scope => :user_id

  def invoices
    contacts.find_by_kind('Invoice').invoices
  end
end

