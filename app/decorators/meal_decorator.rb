# frozen_string_literal: true

class MealDecorator < ApplicationDecorator
  delegate :name, :kind, to:        :item,
                         allow_nil: true

  delegate :price, to: :item, prefix: true

  def meal_info
    "#{name} - #{price}"
  end
end
