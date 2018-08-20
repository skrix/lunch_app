# frozen_string_literal: true

module Menus
  class ShowFacade
    def initialize(params = {})
      @params = params
      @menu   = Menu.find(params[:id])
    end

    attr_reader :menu

    def items
      @items ||= Item.all.decorate
    end

    def meals
      @meals ||= menu.meals.decorate
    end

    def avaliable?
      @menu.created_at.today?
    end

    private

    attr_reader :params
  end
end
