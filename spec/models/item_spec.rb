require 'rails_helper'

describe Item, type: :model do

  let(:first)  { create(:item, :first) }
  let(:second) { create(:item, :second) }
  let(:drink)  { create(:item, :drink) }

  context 'item first_lunch' do
    it 'is valid with valid attributes' do
      expect(first).to be_valid
    end
  end

  context 'item second_lunch' do
    it 'is valid with valid attributes' do
      expect(second).to be_valid
    end
  end

  context 'item drink' do
    it 'is valid with valid attributes' do
      expect(drink).to be_valid
    end
  end

  context 'with invalid attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:kind) }
    it { should have_many(:meals) }
    it { should define_enum_for(:kind) }
  end
end
