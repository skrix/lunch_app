# frozen_string_literal: true

module Menus
  class IndexFacade
    def menus
      @menus ||= Menu.all.decorate
    end
  end
end
