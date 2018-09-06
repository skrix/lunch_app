# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email)      { |n| "#{n}_#{Faker::Internet.email}" }
    sequence(:username)   { |n| "#{n}_#{Faker::Internet.username(1..10)}" }
    password              { SecureRandom.base64(8) }
    password_confirmation { password }

    trait :app_admin do
      after(:create) { |user| user.add_role(:app_admin) }
    end

    trait :lunch_admin do
      after(:create) { |user| user.add_role(:lunch_admin) }
    end

    trait :mortal do
      after(:create) { |user| user.remove_role(:lunch_admin) }
    end

    trait :with_token do
      authentication_token { SecureRandom.base64(5) }
    end
  end
end
