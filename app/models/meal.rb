# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :menu
  belongs_to :item

  validates  :price, presence: true

  delegate :name, to: :item, prefix: true
  delegate :kind, to: :item, prefix: true
end
