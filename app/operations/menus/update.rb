# frozen_string_literal: true

module Menus
  class Update < ::Callable
    def initialize(menu:, **params)
      @menu        = menu
      @menu_params = params.fetch(:menu_params, {})
    end

    def call
      menu&.update(menu_params)
    end

    private

    attr_reader :menu_params, :menu
  end
end
