require 'rails_helper'

describe User, type: :model do

  let(:user) { create(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  context 'with invalid attributes' do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
  end
end
