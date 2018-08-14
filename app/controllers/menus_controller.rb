# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :set_menu, except: %i[index new create]
  before_action :check_policy

  def index
    @facade = Menus::IndexFacade.new
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
    respond_with update_menu, location: menu_path(@facade.menu)
  end

  private

  def check_policy
    authorize(@menu || Menu)
  end

  def update_menu
    Menus::Update.call(
      menu:        @facade.menu,
      menu_params: menu_params
    )
  end

  def set_menu
    @facade = Menus::ShowFacade.new(params)
  end

  def menu_params
    params.require(:menu).permit(
      meals_attributes: %i[id _destroy price item_id]
    )
  end
end
