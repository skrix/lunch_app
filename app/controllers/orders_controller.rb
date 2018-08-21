# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :check_policy

  def index
    @facade = Orders::IndexFacade.new
  end

  def new
    @facade = Orders::NewFacade.new(params)
  end

  def create
    @order = Orders::Create.call(order_params: order_params)

    return respond_with(@order) unless @order.valid?

    render :show
  end

  def show
    @order = Order.find_by(id: params[:id]).decorate
  end

  private

  def check_policy
    authorize(@order || Order)
  end

  def order_params
    params.require(:order).permit(:user_id,
                                  order_meals_attributes: %i[id _destroy meal_id order_id])
  end
end
