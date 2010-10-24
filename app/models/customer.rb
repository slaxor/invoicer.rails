class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :invoices, :dependent => :delete_all
  has_many :defaults, :dependent => :delete_all
  validates_uniqueness_of :name
  validates_uniqueness_of :number, :scope => :user_id
  attr_protected :user_id
end

