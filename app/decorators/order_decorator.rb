# frozen_string_literal: true

class OrderDecorator < ApplicationDecorator
  decorates_association :order_meals

  delegate :email, to:        :user,
                   allow_nil: true,
                   prefix:    true

  def ordered_time
    l(order.created_at, format: :order)
  end
end
