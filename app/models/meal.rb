# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :menu
  belongs_to :item
end
