require 'spec_helper'
describe Invoice do
  describe 'associations' do
    it {  should belong_to :invoicing_party
          should have_many :service_invoice_items }
  end
end

