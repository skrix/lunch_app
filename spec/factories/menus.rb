# frozen_string_literal: true

FactoryBot.define do
  factory :menu do

    trait :full do
      after(:create) do |menu|
        create :meal, :first,  menu: menu
        create :meal, :second, menu: menu
        create :meal, :drink,  menu: menu
      end
    end
  end
end
