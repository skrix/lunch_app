# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :meals
  has_many :items, through: :meals
end
