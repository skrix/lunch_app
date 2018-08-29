# frozen_string_literal: true

class ItemDecorator < ApplicationDecorator
  def item_info
    "#{kind}: #{name} - #{price}"
  end
end
