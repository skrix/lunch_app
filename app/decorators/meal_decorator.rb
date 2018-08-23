# frozen_string_literal: true

class MealDecorator < ApplicationDecorator
  delegate :name, :kind, to:        :item,
                         allow_nil: true

  def meal_info
    "#{name} - #{price}"
  end
end
