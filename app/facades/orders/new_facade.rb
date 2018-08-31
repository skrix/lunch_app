# frozen_string_literal: true

module Orders
  class NewFacade
    def initialize(params = {})
      @menu_id = params[:menu_id]
    end

    def order
      @order ||= Order.new.decorate
    end

    def order_meals
      @order.object_order_meals.build
    end

    delegate :first_lunches, :second_lunches, :drinks,
             to: :menu, allow_nil: true

    private

    attr_reader :menu_id, :params

    def menu
      @menu ||= Menu.find_by(id: menu_id).decorate
    end
  end
end
