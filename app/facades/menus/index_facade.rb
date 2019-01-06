# frozen_string_literal: true

module Menus
  class IndexFacade
    delegate :today, to: Date

    def menus
      @menus ||= Menu.all.decorate
    end

    def week_menus
      Menu.where(created_at: this_week).decorate
    end

    private

    def this_week
      today.beginning_of_week.beginning_of_day..today.end_of_week.end_of_day
    end
  end
end
