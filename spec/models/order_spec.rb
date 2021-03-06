require 'rails_helper'

describe Order, type: :model do
  let(:order) { create(:order) }

  it { should belong_to(:user) }

  context 'with valid params' do
    it { expect(order).to be_valid }
  end

  context 'with invalid attributes' do
    it { should belong_to(:user) }
    it { should accept_nested_attributes_for(:order_meals) }
  end
end
