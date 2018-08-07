# frozen_string_literal: true

class Item < ApplicationRecord
  TYPES = %w[first_lunch second_lunch drink].freeze

  validates :type, inclusion: { in: TYPES }

  enum type: TYPES
end
