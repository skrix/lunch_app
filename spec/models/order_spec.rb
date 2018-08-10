require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }

  context 'is valid with valid attributes' do
    it { expect(order).to be_valid }
  end

  context 'with invalid attributes' do
    it { should belong_to(:user) }
  end
end
