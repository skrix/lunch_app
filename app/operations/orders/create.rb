# frozen_string_literal: true

module Orders
  class Create < ::Callable
    def initialize(params = {})
      @order_params = params.fetch(:order_params, {})
    end

    def call
      create_order unless meals_inconsistency?

      order
    end

    private

    attr_reader :order_params

    def create_order
      order.tap(&:save).decorate
    end

    def order
      @order ||= Order.new(order_params)
    end

    def meals_inconsistency?
      Item.kinds.keys.each(&method(:handle_order_errors))

      order.errors.any?
    end

    def handle_order_errors(kind)
      order.errors.add(:base) unless meal_with_kind?(kind)
    end

    def meal_with_kind?(kind)
      meals.exists?("items.kind": kind)
    end

    def meals
      @meals ||= Meal.where(id: meals_ids)&.joins(:item)
    end

    def meals_ids
      @meals_ids ||= meals_params.reduce([]) { |ids, meal| ids << meal.last[:meal_id].to_i }
    end

    def meals_params
      @meals_params ||= order_params.fetch(:order_meals_attributes).to_h
    end
  end
end
