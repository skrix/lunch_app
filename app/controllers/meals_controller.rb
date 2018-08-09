# frozen_string_literal: true

class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def create
    @meal = Meals::Create.call(meal_params: meal_params)

    return respond_with(@item) unless @item.valid?

    render :show
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:price, :item_id, :menu_id)
  end
end
