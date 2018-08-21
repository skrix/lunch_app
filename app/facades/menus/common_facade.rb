# frozen_string_literal: true

module Menus
  class CommonFacade
    def initialize(menu:)
      @menu = menu
    end

    attr_reader :menu

    def items
      @items ||= Item.all.decorate
    end

    def meals
      @meals ||= menu.meals
    end

    def avaliable?
      @menu.created_at.today?
    end
  end
end
