# frozen_string_literal: true

FactoryBot.define do
  # Factory for valid user
  factory :user do
    email                 { Faker::Internet.email }
    password              { SecureRandom.base64(8) }
    password_confirmation { password }
  end

  # Factories for invalid user
  factory :invalid_user_without_email, parent: :user do
    email nil
    password              { SecureRandom.base64(8) }
    password_confirmation { password }
  end

  factory :invalid_user_without_password, parent: :user do
    email { Faker::Internet.email }
    password nil
  end
end
