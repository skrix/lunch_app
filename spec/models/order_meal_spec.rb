require 'rails_helper'

RSpec.describe OrderMeal, type: :model do
  let(:order_meal) { create(:order_meal) }

  context 'is valid with valid attributes' do
    it { expect(order_meal).to be_valid }
  end

  context 'with invalid attributes' do
    it { should belong_to(:order) }
    it { should belong_to(:meal) }
  end
end
