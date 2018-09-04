# frozen_string_literal: true

module Api
  module V1
    class OrdersController < Api::V1::ApplicationController
      decorates_assigned :order

      def index
        @orders = Order.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day)
        render json: Api::V1::OrderSerializer.new(@orders, options)
      end

      private

      def options
        options           = {}
        options[:include] = %i[user meals]
        options
      end
    end
  end
end
