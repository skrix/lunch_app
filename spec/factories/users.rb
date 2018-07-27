# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # Factories for valid user
    factory :valid_user do
      email                 { Faker::Internet.email }
      password              { SecureRandom.base64(8) }
      password_confirmation { password }
    end

    # Factories for invalid user
    factory :invalid_user do
      factory :invalid_user_without_email do
        password              { SecureRandom.base64(8) }
        password_confirmation { password }
      end

      factory :invalid_user_without_password do
        email { Faker::Internet.email }
      end
    end
  end
end
