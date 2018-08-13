# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :menu
  belongs_to :item
  has_many   :order_meals, inverse_of: :order, dependent: :nullify

  validates  :price, presence: true

  delegate :name, to: :item, prefix: true
  delegate :kind, to: :item, prefix: true

  Item.kinds.keys.each do |kind|
    scope kind, -> { joins(:item).where(items: { kind: kind }) }
  end
end
