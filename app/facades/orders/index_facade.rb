# frozen_string_literal: true

module Orders
  class IndexFacade
    def orders
      @orders ||= Order.all.decorate
    end
  end
end
