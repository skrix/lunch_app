require 'rails_helper'

describe User, type: :model do
  it "is valid with valid attributes"

  it "is not valid without a email"
  it "is not valid without a password"
  it "is not valid without a password_confirmation"

  it "is not valid with invalid email"
  it "is not valid with too long email"
  it "is not valid with too short email"

  it "is not valid with invalid password"
  it "is not valid with too long password"
  it "is not valid with too short password"
end
