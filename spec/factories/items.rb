# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "#{n}_#{Faker::Food.dish.truncate(10)}" }
    price { Faker::Number.decimal(3, 2) }

    trait :first do
      kind { Item::FIRST_LUNCH }
    end

    trait :second do
      kind { Item::SECOND_LUNCH }
    end

    trait :drink do
      sequence(:name) { |n| "#{n}_#{Faker::Beer.name.truncate(10)}" }
      kind { Item::DRINK }
    end
  end
end
