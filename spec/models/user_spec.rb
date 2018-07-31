require 'rails_helper'

describe User, type: :model do
  # Errors definition
  let(:short_error_name)   { 'is too short (minimum is 2 characters)' }
  let(:long_error_name)    { 'is too long (maximum is 30 characters)' }
  let(:short_error_email)  { 'is too short (minimum is 6 characters)' }
  let(:long_error_email)   { 'is too long (maximum is 40 characters)' }
  let(:unique_error_email) { 'has already been taken' }
  let(:invalid_error)      { 'is invalid' }
  let(:blank_error)        { 'can\'t be blank' }
  let(:confirmation_error) { 'doesn\'t match Password' }

  it "is valid with valid attributes" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "is not valid without a email" do
    user = FactoryBot.build(:invalid_user_without_email)
    expect(user).not_to be_valid
    expect(user.errors.messages[:email]).to eq [blank_error]
  end

  it "is not valid without a password" do
    user = FactoryBot.build(:invalid_user_without_password)
    expect(user).not_to be_valid
    expect(user.errors.messages[:password]).to eq [blank_error]
  end

  it "is not valid with invalid email" do
    user = FactoryBot.build(:user, email: 'insads')
    expect(user).not_to be_valid
    expect(user.errors.messages[:email]).to eq [invalid_error]
  end

  it "is not valid with too long email"
  it "is not valid with too short email"
  it "is not valid with invalid password"
  it "is not valid with too long password"
  it "is not valid with too short password"
end
