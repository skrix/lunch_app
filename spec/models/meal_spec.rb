require 'rails_helper'

describe Meal, type: :model do
  let(:first)  { create(:meal, :first, :with_menu) }
  let(:second) { create(:meal, :second, :with_menu) }
  let(:drink)  { create(:meal, :drink, :with_menu) }

  context 'meal first_lunch' do
    it 'is valid with valid attributes' do
      expect(first).to be_valid
    end
  end

  context 'meal second_lunch' do
    it 'is valid with valid attributes' do
      expect(second).to be_valid
    end
  end

  context 'meal drink' do
    it 'is valid with valid attributes' do
      expect(drink).to be_valid
    end
  end

  context 'with invalid attributes' do
    it { should belong_to(:item) }
    it { should belong_to(:menu) }
  end

  context 'with valid price' do
    let!(:control_meal) { first.decorate }

    it 'set the same price as in item' do
      expect(control_meal.price).to eq(control_meal.item_price)
    end
  end
end
