# frozen_string_literal: true

module Orders
  class IndexFacade
    def initialize(params = {})
      @params = params
    end

    def orders
      @orders ||= Order
        .all
        .yield_self(&method(:filter_orders))
        .decorate
    end

    def orders_cost
      orders.sum(&:order_price)
    end

    private

    attr_reader :params

    def created_at
      params.dig(:created_at)
    end

    def date_specified?
      created_at.present?
    end

    def parse_date
      Date.strptime(created_at, I18n.t('datepicker_date_format'))
    end

    def filter_orders(results)
      return results unless date_specified?

      results.where(created_at: parse_date.beginning_of_day.utc..parse_date.end_of_day.utc)
    end
  end
end
