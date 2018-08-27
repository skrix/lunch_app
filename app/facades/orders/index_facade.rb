# frozen_string_literal: true

module Orders
  class IndexFacade
    def initialize(params = {})
      @params = params
    end

    def orders
      @orders ||= filter_orders(parse_date).decorate if date_specified?
      @orders ||= Order.all.decorate
    end

    def orders_total
      orders.inject(0, &method(:sum_orders))
    end

    private

    attr_reader :params

    def sum_orders(current_sum, order)
      current_sum + order.order_price
    end

    def created_at
      params.dig(:created_at_sort, :created_at)
    end

    def date_specified?
      params.key?(:created_at_sort) && created_at.present?
    end

    def parse_date
      Date.strptime(created_at, I18n.t('datepicker_date_format'))
    end

    def filter_orders(date)
      Order.where(created_at: date.beginning_of_day.utc..date.end_of_day.utc)
    end
  end
end
