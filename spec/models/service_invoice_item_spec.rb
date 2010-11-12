require 'spec_helper'
describe ServiceInvoiceItem do
  describe 'associations' do
    it { should belong_to :invoice }
    it { should have_many :pauses }
  end
end

