FactoryBot.define do
  factory :order_meal do
    association :meal,  factory: %i[meal first with_menu]

    trait :with_order do
      association :order, factory: :order
    end

    trait :first do
      association :meal, factory: %i[meal first with_menu]
    end

    trait :second do
      association :meal, factory: %i[meal second with_menu]
    end

    trait :drink do
      association :meal, factory: %i[meal drink with_menu]
    end
  end
end
