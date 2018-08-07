FactoryBot.define do
  factory :item do
    name  { Faker::Food.dish }
    price { Faker::Number.decimal(3, 2) }

    trait :first do
      type 'first_lunch'
    end

    trait :second do
      type 'second_lunch'
    end

    trait :drink do
      type 'drink'
    end
  end
end
