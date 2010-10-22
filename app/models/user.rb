class User < ActiveRecord::Base
  has_many :invoicing_parties, :dependent => :delete_all
  has_many :customers, :dependent => :delete_all
  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional
end
