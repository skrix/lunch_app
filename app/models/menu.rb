# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :meals, inverse_of: :menu,  dependent: :nullify
  has_many :items, through:    :meals, dependent: :nullify

  Item.kinds.keys.each do |kind|
    has_many kind.pluralize.to_sym, -> { send(kind) }, class_name: Meal.name
  end

  accepts_nested_attributes_for :meals,
                                reject_if:     :all_blank,
                                allow_destroy: true

  validate :full?

  def full?
    return if (Item.kinds.keys - added_kinds).blank?

    errors.add(:meals)
  end

  def added_kinds
    MealDecorator.decorate_collection(meals).map(&:kind).uniq
  end
end
