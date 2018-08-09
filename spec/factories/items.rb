# frozen_string_literal: true

FactoryBot.define do

  factory :item do
    name  { Faker::Food.dish }
    price { Faker::Number.decimal(3, 2) }

    trait :first do
      kind Item::FIRST_LUNCH
    end

    trait :second do
      kind Item::SECOND_LUNCH
    end

    trait :drink do
      kind Item::DRINK
    end
  end
end
