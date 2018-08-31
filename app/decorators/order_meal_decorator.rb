# frozen_string_literal: true

class OrderMealDecorator < ApplicationDecorator
  decorates_association :meal

  delegate :name, :kind, :price, to:        :meal,
                                 allow_nil: true,
                                 prefix:    true
end
