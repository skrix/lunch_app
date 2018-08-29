# frozen_string_literal: true

module Menus
  class IndexFacade
    def menus
      @menus ||= Menu.all.decorate
    end

    def week_menus
      Menu.where(created_at: this_week_days).decorate
    end

    private

    def this_week_days
      today.beginning_of_week..today.end_of_week
    end

    def today
      Date.today
    end
  end
end
