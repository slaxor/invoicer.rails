require File.join(File.dirname(__FILE__),  '..', 'spec_helper')

describe InvoicingParty do
  describe 'associations' do
    it {
      should belong_to :user
      should have_many :invoices
    }
  end
end
