require 'rails_helper'

describe User, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  context 'with invalid attributes' do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username) }

    it do
      should validate_length_of(:username).is_at_least(2).is_at_most(30)
    end
  end
end
