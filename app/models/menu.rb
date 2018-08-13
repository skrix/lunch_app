# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :meals, inverse_of: :menu
  has_many :items, through:    :meals

  Item.kinds.keys.each do |kind|
    has_many kind.pluralize.to_sym, -> { send(kind) }, class_name: Meal.name
  end

  accepts_nested_attributes_for :meals,
                                reject_if:     :all_blank,
                                allow_destroy: true
end
