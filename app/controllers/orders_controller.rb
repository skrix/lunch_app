# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :check_policy

  decorates_assigned :order

  def index
    @facade = Orders::IndexFacade.new(params)
  end

  def new
    @facade = Orders::NewFacade.new(params)
  end

  def create
    @order = Orders::Create.call(order_params: order_params)

    return redirect_with_errors unless @order.valid?

    render :show
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  private

  def redirect_with_errors
    redirect_back(fallback_location: new_order_path, notice: t('validation.order.invalid'))
  end

  def check_policy
    authorize(@order || Order)
  end

  def order_params
    params
      .require(:order)
      .permit(:user_id,
              order_meals_attributes: %i[id _destroy meal_id order_id])
  end
end
