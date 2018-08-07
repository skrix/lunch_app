FactoryBot.define do
  factory :item do
    name  { Faker::Food.dish }
    price { Faker::Number.decimal(3, 2) }

    trait :first do
      kind 'first_lunch'
    end

    trait :second do
      kind 'second_lunch'
    end

    trait :drink do
      kind 'drink'
    end
  end
end
