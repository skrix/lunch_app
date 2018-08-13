# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Orders::Create.call(order_params: order_params)

    return respond_with(@order) unless @order.valid?

    render :show
  end

  def update
    respond_with update_order, location: order_path(@order)
  end

  private

  def update_order
    Orders::Update.call(
      order:        @order,
      order_params: order_params
    )
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id,
                                  order_meals_attributes: %i[id _destroy meal_id order_id])
  end
end
