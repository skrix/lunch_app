require 'rails_helper'

describe Meal, type: :model do
  let(:first)  { create(:meal, :first) }
  let(:second) { create(:meal, :second) }
  let(:drink)  { create(:meal, :drink) }

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
    it { should validate_presence_of(:price) }
    it { should belong_to(:item) }
    it { should belong_to(:menu) }
  end
end
