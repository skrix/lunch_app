# frozen_string_literal: true

module Menus
  class CommonFacade
    delegate :meals, to: :decorated_menu
    delegate :name,  to: :decorated_menu

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

    private

    def decorated_menu
      @decorated_menu ||= @menu.decorate
    end
  end
end
