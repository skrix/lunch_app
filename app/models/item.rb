# frozen_string_literal: true

class Item < ApplicationRecord
  TYPES = %w[first_lunch second_lunch drink].freeze

  has_many :meals

  validates :type, inclusion: { in: TYPES }

  enum type: TYPES
end
