# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new

    @first_lunches  = Orders::NewFacade.new(params).first_lunches
    @second_lunches = Orders::NewFacade.new(params).second_lunches
    @drinks         = Orders::NewFacade.new(params).drinks
  end

  def create
    @order = Orders::Create.call(order_params: order_params)

    return respond_with(@order) unless @order.valid?

    render :show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id,
                                  order_meals_attributes: %i[id _destroy meal_id order_id])
  end
end
