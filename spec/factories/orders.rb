FactoryBot.define do
  factory :order do
    after(:build) do |order|
      create :order_meal, :first,  order: order
      create :order_meal, :second, order: order
      create :order_meal, :drink,  order: order
    end

    association :user, factory: :user
  end
end
