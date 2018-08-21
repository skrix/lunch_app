# frozen_string_literal: true

class MenuDecorator < ApplicationDecorator
  decorates_association :meals

  Item.kinds.keys.each do |kind|
    decorates_association kind.pluralize.to_sym
  end

  delegate :name, :kind, to:        :item,
                         allow_nil: true,
                         prefix:    true

  def name
    l(menu.created_at, format: :menu)
  end
end
