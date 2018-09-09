# frozen_string_literal: true

module Menus
  module MealPrice
    class Setter < ::Callable
      def initialize(menu_params:)
        @menu_params = menu_params.to_h
      end

      def call
        add_price

        menu_params
      end

      private

      attr_reader :menu_params

      def add_price
        check_params.values.each { |meal| meal[:price] = extract_price(meal) }
      end

      def check_params
        menu_params.fetch(:meals_attributes, {})
      end

      def extract_price(meal)
        Menus::MealPrice::Mapper.call(meal: meal)
      end
    end
  end
end
