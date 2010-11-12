require 'spec_helper'
describe Customer do
  describe 'associations' do
    it { should belong_to :user }
  end
end


