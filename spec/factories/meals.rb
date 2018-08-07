FactoryBot.define do
  factory :meal do
    price { Faker::Number.decimal(3, 2) }

    association :menu, factory: :menu

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
