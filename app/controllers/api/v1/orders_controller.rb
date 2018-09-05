# frozen_string_literal: true

module Api
  module V1
    class OrdersController < Api::V1::ApplicationController
      decorates_assigned :order

      def index
        @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)

        render json: Api::V1::OrderSerializer.new(@orders, include: %i[user meals items])
      end
    end
  end
end
