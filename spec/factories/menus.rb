# frozen_string_literal: true

FactoryBot.define do
  factory :menu do

    trait :full do
      after(:create) do |menu|
        Item.kinds.values
          .each { |kind| create(:meal, kind.to_sym,  menu: menu) }
      end
    end
  end
end
