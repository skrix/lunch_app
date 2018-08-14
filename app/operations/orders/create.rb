# frozen_string_literal: true

module Orders
  class Create < ::Callable
    def initialize(params = {})
      @order_params = params.fetch(:order_params, {})
    end

    def call
      Order.create(order_params).decorate
    end

    private

    attr_reader :order_params
  end
end
