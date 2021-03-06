# frozen_string_literal: true

class OrderDecorator < ApplicationDecorator
  decorates_association :order_meals

  delegate :order_meals, to:     :object,
                         prefix: true

  delegate :username,    to: :user

  def ordered_time
    l(order.created_at, format: :order)
  end

  def order_price
    @order_price ||= order_meals.sum(&:meal_price)
  end
end
