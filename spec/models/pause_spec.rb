require File.join(File.dirname(__FILE__),  '..', 'spec_helper')

describe Pause do
  describe 'associations' do
    it {
      should belong_to :service_invoice_item
    }
  end
end
