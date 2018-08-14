# frozen_string_literal: true

class MealDecorator < ApplicationDecorator
  delegate :name, :kind, to:        :item,
                         allow_nil: true,
                         prefix:    false

  def meal_info
    "#{name} - #{price}"
  end
end
