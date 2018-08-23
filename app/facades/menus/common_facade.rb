# frozen_string_literal: true

module Menus
  class CommonFacade
    delegate :meals, to: :menu

    attr_reader :menu

    def initialize(menu:)
      @menu = menu
    end

    def items
      @items ||= Item.all.decorate
    end

    def available?
      @menu.created_at.today?
    end
  end
end
