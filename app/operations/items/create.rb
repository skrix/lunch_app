# frozen_string_literal: true

module Items
  class Create < ::Callable
    def initialize(params = {})
      @item_params = params.fetch(:item_params, {})
    end

    def call
      Item.create(item_params)
    end

    private

    attr_reader :item_params
  end
end
