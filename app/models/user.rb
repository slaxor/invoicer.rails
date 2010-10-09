class User < ActiveRecord::Base
  has_many :invoices
  has_many :invoicing_parties
  has_many :customers
  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional
end
