# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :menu
  belongs_to :item
  has_many   :order_meals, inverse_of: :meal, dependent: :nullify

  validates :price, presence: true, numericality: { greater_than: 0 }

  Item.kinds.keys.each do |kind|
    scope kind, -> { joins(:item).where(items: { kind: kind }) }
  end
end
