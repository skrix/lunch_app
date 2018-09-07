# frozen_string_literal: true

module Menus
  class MealPriceSetter < ::Callable
    def initialize(menu_params:)
      @menu_params = menu_params.to_h
    end

    def call
      add_price(menu_params)
    end

    private

    attr_reader :menu_params

    def add_price(menu_params)
      menu_params.fetch(:meals_attributes).map do |meal|
        meal.last.merge!(hash_price(get_price(item_id(meal.last))))
      end

      menu_params
    end

    def item_id(meal)
      meal.fetch('item_id').to_i
    end

    def get_price(id)
      Item.find_by(id: id).price
    end

    def hash_price(price)
      { price: price }
    end
  end
end
