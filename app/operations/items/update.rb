# frozen_string_literal: true

module Items
  class Update < ::Callable
    def initialize(item:, **params)
      @item        = item
      @item_params = params.fetch(:item_params, {})
    end

    def call
      item&.update(item_params)
    end

    private

    attr_reader :item_params, :item
  end
end
