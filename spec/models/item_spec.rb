require 'rails_helper'

describe Item, type: :model do
  let(:first)  { create(:item, :first) }
  let(:second) { create(:item, :second) }
  let(:drink)  { create(:item, :drink) }

  context 'is valid with valid attributes' do
    it { expect(first).to be_valid }
    it { expect(second).to be_valid }
    it { expect(drink).to be_valid }
  end

  context 'with invalid attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:kind) }
    it { should have_many(:meals) }
  end
end
