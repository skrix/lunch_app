# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email)      { |n| "#{n}_#{Faker::Internet.email}" }
    password              { SecureRandom.base64(8) }
    password_confirmation { password }

    trait :app_admin do
      after(:create) { |user| user.add_role(:app_admin) }
    end
    trait :lunch_admin do
      after(:create) { |user| user.add_role(:lunch_admin) }
    end
  end
end
