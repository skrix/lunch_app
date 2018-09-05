# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many   :order_meals, inverse_of: :order,    dependent: :destroy
  has_many   :meals,       through: :order_meals, dependent: :nullify
  has_many   :items,       through: :meals,       dependent: :nullify

  accepts_nested_attributes_for :order_meals,
                                reject_if:     :all_blank,
                                allow_destroy: true

  validate :full?

  def full?
    return if (Item.kinds.keys - ordered_kinds).blank?

    errors.add(:meals)
  end

  def ordered_kinds
    OrderMealDecorator.decorate_collection(order_meals).map(&:meal_kind).uniq
  end
end
