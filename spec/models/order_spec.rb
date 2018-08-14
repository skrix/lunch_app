require 'rails_helper'

describe Order, type: :model do
  let(:order) { create(:order) }

  it { expect(order).to be_valid }

  context 'with invalid attributes' do
    it { should belong_to(:user) }
  end
end
