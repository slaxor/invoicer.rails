describe Invoice do
  describe 'associations' do
    should_belong_to :invoicing_party
    should_have_many :service_invoice_items
  end
end

