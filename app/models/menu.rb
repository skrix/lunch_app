# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :meals, inverse_of: :menu
  has_many :items, through:    :meals

  accepts_nested_attributes_for :meals,
                                reject_if:     :all_blank,
                                allow_destroy: true
end
