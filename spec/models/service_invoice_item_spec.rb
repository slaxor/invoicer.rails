require File.join(File.dirname(__FILE__),  '..', 'spec_helper')

describe ServiceInvoiceItem do
  describe 'associations' do
    it {
     should belong_to :invoice
     should have_many :pauses
    }
  end
end

