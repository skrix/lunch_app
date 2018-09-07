# frozen_string_literal: true

FactoryBot.define do
  factory :meal do

    trait :with_menu do
      menu
    end

    trait :first do
      association :item, factory: %i[item first]
      price { item.price }
    end

    trait :second do
      association :item, factory: %i[item second]
      price { item.price }
    end

    trait :drink do
      association :item, factory: %i[item drink]
      price { item.price }
    end
  end
end
