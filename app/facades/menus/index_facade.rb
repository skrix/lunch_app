# frozen_string_literal: true

module Menus
  class IndexFacade
    WEEK_DAYS = 5

    def menus
      @menus ||= Menu.all.decorate
    end

    def week_menus
      ordered_menus.last(WEEK_DAYS)
    end

    private

    def ordered_menus
      @ordered_menus ||= Menu.order(created_at: :asc).decorate
    end
  end
end
