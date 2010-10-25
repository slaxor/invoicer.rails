require 'shoulda'
describe Customer do
  describe 'associations' do
      should_belong_to :user
  end
end


