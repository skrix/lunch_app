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
      @order.order_meals.object.build
    end

    def first_lunches
      @first_lunches ||= menu&.first_lunches
    end

    def second_lunches
      @second_lunches ||= menu&.second_lunches
    end

    def drinks
      @drinks ||= menu&.drinks
    end

    private

    attr_reader :menu_id, :params

    def menu
      @menu ||= Menu.find_by(id: menu_id).decorate
    end
  end
end
