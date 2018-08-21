# frozen_string_literal: true

module Menus
  class NewFacade
    def initialize(params = {})
      @params = params
    end

    def menu
      @menu ||= Menu.new.decorate
    end

    def items
      @items ||= Item.all.decorate
    end
  end
end
