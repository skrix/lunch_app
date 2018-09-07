# frozen_string_literal: true

module Menus
  module MealPrice
    class Mapper < ::Callable
      delegate :price, to: :item, allow_nil: true

      def initialize(meal)
        @meal = meal
      end

      def call
        { price: price }
      end

      private

      attr_reader :meal

      def item
        @item ||= Item.find_by(id: meal[:item_id])
      end
    end
  end
end
