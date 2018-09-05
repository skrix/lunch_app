require 'rails_helper'

describe Menu, type: :model do
  let(:menu) { create(:menu) }

  it 'is valid with valid attributes' do
    expect(menu).to be_valid
  end

  context 'with invalid attributes' do
    it { should have_many(:meals) }
    it { should accept_nested_attributes_for(:meals) }
  end
end
