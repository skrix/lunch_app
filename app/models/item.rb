# frozen_string_literal: true

class Item < ApplicationRecord
  KINDS = %w[first_lunch second_lunch drink].freeze

  has_many :meals

  validates :name, :price, :kind, presence: true
  validates :kind, inclusion: { in: KINDS }

  enum kind: KINDS
end
