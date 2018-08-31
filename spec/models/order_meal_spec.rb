require 'rails_helper'

describe OrderMeal, type: :model do
  let(:order_meal) { create(:order_meal, :with_order) }

  it { expect(order_meal).to be_valid }

  context 'with invalid attributes' do
    it { should belong_to(:order) }
    it { should belong_to(:meal) }
  end
end
