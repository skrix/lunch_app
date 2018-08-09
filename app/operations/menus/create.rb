# frozen_string_literal: true

module Menus
  class Create < ::Callable
    def initialize(params = {})
      @menu_params = params.fetch(:menu_params, {})
    end

    def call
      @menu = Menu.create()
      create_meals
      @menu
    end

    private

    attr_reader :menu_params, :menu

    def create_meals
      included_items.each do |id|
        item = Item.find(id.to_i)
        Meals::Create.call(meal_params: { item_id: id.to_i, menu_id: menu.id, price: item.price })
      end
    end

    def included_items
      items = menu_params.fetch(:item_ids)
      items.shift
      items
    end
  end
end
