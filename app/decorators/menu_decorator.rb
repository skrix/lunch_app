# frozen_string_literal: true

class MenuDecorator < ApplicationDecorator
  decorates_association :meals

  delegate :name, :kind, to:        :item,
                         allow_nil: true,
                         prefix:    true
end
