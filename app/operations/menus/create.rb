# frozen_string_literal: true

module Menus
  class Create < ::Callable
    def initialize(params = {})
      @menu_params = params.fetch(:menu_params, {})
    end

    def call
      Menu.create(menu_params)
    end

    private

    attr_reader :menu_params
  end
end
