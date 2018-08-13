# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many   :order_meals, inverse_of: :order
  has_many   :meals,       through: :order_meals

  accepts_nested_attributes_for :order_meals,
                                reject_if:     :all_blank,
                                allow_destroy: true
end
