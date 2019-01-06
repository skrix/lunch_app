# frozen_string_literal: true

module Api
  module V1
    class MenusController < Api::V1::ApplicationController
      def index
        @menus = Menu.all

        render json: Api::V1::MenuSerializer.new(@menus, include: %i[meals items])
      end

      def show
        @menu = Menu.find_by(id: params[:id])

        render json: Api::V1::MenuSerializer.new(@menu, include: %i[meals items])
      end

      private

      def menu_params
        params
          .fetch(:menu, {})
          .permit(meals_attributes: %i[id _destroy item_id])
      end
    end
  end
end
