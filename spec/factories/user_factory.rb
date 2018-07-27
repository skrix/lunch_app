# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # Factories for valid user
    factory :valid_user do
      @pass = 'password'
      sequence(:email) { |n| "username#{n}@example.com" }
      password @pass

      factory :valid_user_for_registration do
        password_confirmation @pass
      end
    end


    # Factories for invalid user
    factory :invalid_user do
      factory :invalid_user_without_email do
        @pass = 'password'

        password @pass
        password_confirmation @pass
      end

      factory :invalid_user_without_password do
        email 'username@example.com'
      end
    end
  end
end
