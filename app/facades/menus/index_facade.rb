# frozen_string_literal: true

module Menus
  class IndexFacade
    def menus
      @menus ||= Menu.all.decorate
    end

    def week_menus
      menus.last(5)
    end
  end
end
