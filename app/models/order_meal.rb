# frozen_string_literal: true

class OrderMeal < ApplicationRecord
  belongs_to :order, inverse_of: :order_meals
  belongs_to :meal,  inverse_of: :order_meals
end
