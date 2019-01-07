# frozen_string_literal: true

module Api
  module Internal
    class MenusController < Api::Internal::ApplicationController
      before_action :set_menu, only: :show

      def show
        @facade = Menus::CommonFacade.new(menu: @menu)
      end

      private

      def set_menu
        @menu = Menu.find_by(id: params[:id])
      end

      def menu_params
        params
          .fetch(:menu, {})
          .permit(meals_attributes: %i[id _destroy item_id])
      end
    end
  end
end
