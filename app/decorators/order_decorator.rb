# frozen_string_literal: true

class OrderDecorator < ApplicationDecorator
  decorates_association :order_meals

  delegate :email, to:        :user,
                   allow_nil: true,
                   prefix:    true

  def ordered_time
    l(order.created_at, format: :order)
  end

  def order_price
    @order_price ||= order_meals.inject(0, &method(:sum_prices))
  end

  private

  def sum_prices(current_sum, order_meal)
    current_sum + order_meal.meal_price
  end
end
