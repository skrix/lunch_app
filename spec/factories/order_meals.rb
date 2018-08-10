FactoryBot.define do
  factory :order_meal do
    association :order, factory: :order
    association :meal,  factory: %i[meal first]
  end
end
