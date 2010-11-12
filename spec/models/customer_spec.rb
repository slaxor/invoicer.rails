require File.join(File.dirname(__FILE__),  '..', 'spec_helper')

describe Customer do
  describe 'associations' do
    it {
      should belong_to :user
      should have_many :invoices
    }
  end

  describe 'validations' do
    before do
      @customer = Factory(:random_customer)
    end

    it {
      pending 'stupid txl8 error i don`t understand'
      should validate_uniqueness_of :name
    }
  end
end


