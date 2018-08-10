# frozen_string_literal: true

class OrderMeal < ApplicationRecord
  belongs_to :order
  belongs_to :meal
end
