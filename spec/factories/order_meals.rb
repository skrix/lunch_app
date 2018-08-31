FactoryBot.define do
  factory :order_meal do
    association :meal,  factory: %i[meal first]

    trait :with_order do
      association :order, factory: :order
    end

    trait :first do
      association :meal, factory: %i[meal first]
    end

    trait :second do
      association :meal, factory: %i[meal second]
    end

    trait :drink do
      association :meal, factory: %i[meal drink]
    end
  end
end
