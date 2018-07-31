# frozen_string_literal: true

FactoryBot.define do
  # Factory for valid user
  factory :user do
    sequence(:email) { |n| "#{n}_#{Faker::Internet.email}" }
    password              { SecureRandom.base64(8) }
    password_confirmation { password }
  end

  # Factories for invalid user
  factory :without_email, parent: :user do
    email nil
  end

  factory :without_password, parent: :user do
    password nil
  end
end
