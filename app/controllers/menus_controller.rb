# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to @menu, notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_url, notice: 'Menu was successfully destroyed.'
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.fetch(:menu, {})
  end
end
