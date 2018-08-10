# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :meals
  has_many :menus, through: :meals

  validates :name, :price, :kind, presence: true

  enum kind: {
    first_lunch:  FIRST_LUNCH  = 'first',
    second_lunch: SECOND_LUNCH = 'second',
    drink:        DRINK        = 'drink'
  }
end
