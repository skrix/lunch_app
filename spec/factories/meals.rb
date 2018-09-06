# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    price { Faker::Number.decimal(3, 2) }

    trait :with_menu do
      association :menu, factory: :menu
    end

    trait :first do
      association :item, factory: %i[item first]
    end

    trait :second do
      association :item, factory: %i[item second]
    end

    trait :drink do
      association :item, factory: %i[item drink]
    end
  end
end
