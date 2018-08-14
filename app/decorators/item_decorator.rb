# frozen_string_literal: true

class ItemDecorator < ApplicationDecorator
  def item_info
    "#{name} - #{price}"
  end
end
