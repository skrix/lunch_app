FactoryBot.define do
  factory :order do
    after(:build) do |order|
      Item.kinds.values
        .each { |kind| order.order_meals << build(:order_meal, kind.to_sym) }
    end

    user
  end
end
