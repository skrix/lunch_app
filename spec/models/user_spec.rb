require 'rails_helper'

describe User, type: :model do

  let(:user) { create(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  context 'with invalid attributes' do
    context 'without a password attribute' do
      let(:user) { build(:without_password) }

      it "is not valid" do
        should validate_presence_of(:password)
        expect(user).not_to be_valid
      end
    end

    context 'without a email attribute' do
      let(:user) { build(:without_email) }

      it "is not valid" do
        should validate_presence_of(:email)
        expect(user).not_to be_valid
      end
    end
  end
end
