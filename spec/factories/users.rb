# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email)      { |n| "#{n}_#{Faker::Internet.email}" }
    password              { SecureRandom.base64(8) }
    password_confirmation { password }
  end
end
