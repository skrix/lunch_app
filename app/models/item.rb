# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :meals
  has_many :menus, through: :meals

  validates :name, :price, :kind, presence: true

  validates :name,  uniqueness:   true
  validates :name,  length:       { in: User::NAME_LENGTH }
  validates :price, numericality: { greater_than: 0 }

  enum kind: {
    first_lunch:  FIRST_LUNCH  = 'first',
    second_lunch: SECOND_LUNCH = 'second',
    drink:        DRINK        = 'drink'
  }
end
