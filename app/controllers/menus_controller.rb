# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update]
  before_action :check_policy

  decorates_assigned :menu

  def index
    @facade = Menus::IndexFacade.new
  end

  def show
    @facade = Menus::CommonFacade.new(menu: menu)
  end

  def edit
    @facade = Menus::CommonFacade.new(menu: menu)
  end

  def new
    @facade = Menus::NewFacade.new
  end

  def create
    @menu = Menus::Create.call(menu_params: menu_params)

    return respond_with(@menu) unless @menu.valid?

    redirect_to @menu
  end

  def update
    respond_with update_menu, location: menu_path(@menu)
  end

  private

  def check_policy
    authorize(@menu || Menu)
  end

  def update_menu
    Menus::Update.call(
      menu:        @menu,
      menu_params: menu_params
    )
  end

  def set_menu
    @menu = Menu.find_by(id: params[:id])
  end

  def menu_params
    params.require(:menu).permit(
      meals_attributes: %i[id _destroy price item_id]
    )
  end
end
