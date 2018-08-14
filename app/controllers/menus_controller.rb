# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def index
    authorize(Menu)

    @menus = Menu.all
  end

  def new
    authorize(Menu)

    @menu = Menu.new
  end

  def create
    authorize(Menu)

    @menu = Menus::Create.call(menu_params: menu_params)

    return respond_with(@menu) unless @menu.valid?

    render :show
  end

  def update
    authorize(@menu)

    respond_with update_menu, location: menu_path(@menu)
  end

  private

  def update_menu
    Menus::Update.call(
      menu:        @menu,
      menu_params: menu_params
    )
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(
      meals_attributes: %i[id _destroy price item_id]
    )
  end
end
