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
    @facade = Menus::CommonFacade.new(menu: @menu)
  end

  def new
    @facade = Menus::NewFacade.new
  end

  def create
    @menu = Menus::Create.call(menu_params: full_params)

    return redirect_with_errors unless @menu.valid?

    redirect_to @menu
  end

  def update
    respond_with update_menu, location: menu_path(@menu)
  end

  private

  def redirect_with_errors
    redirect_back(fallback_location: new_menu_path, notice: t('validation.menu.invalid'))
  end

  def check_policy
    authorize(@menu || Menu)
  end

  def update_menu
    Menus::Update.call(
      menu:        @menu,
      menu_params: full_params
    )
  end

  def set_menu
    @menu = Menu.find_by(id: params[:id])
  end

  def full_params
    Menus::MealPriceSetter.call(menu_params: menu_params)
  end

  def menu_params
    params
      .fetch(:menu, {})
      .permit(meals_attributes: %i[id _destroy item_id])
  end
end
