require 'rails_helper'

RSpec.describe Menu, type: :model do

  let(:menu) { create(:menu) }

  it 'is valid with valid attributes' do
    expect(menu).to be_valid
  end

  context 'with invalid attributes' do
    it { should have_many(:meals) }
  end
end
