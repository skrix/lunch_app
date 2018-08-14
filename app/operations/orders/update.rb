# frozen_string_literal: true

module Orders
  class Update < ::Callable
    def initialize(order:, **params)
      @order        = order
      @order_params = params.fetch(:order_params, {})
    end

    def call
      order.update(order_params).decorate
    end

    private

    attr_reader :order_params, :order
  end
end
