# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    authorize(Item)

    @items = Item.all
  end

  def new
    authorize(Item)

    @item = Item.new
  end

  def create
    authorize(Item)

    @item = Items::Create.call(item_params: item_params)

    return respond_with(@item) unless @item.valid?

    render :show
  end

  def update
    authorize(@item)

    respond_with update_item, location: item_path(@item)
  end

  private

  def update_item
    Items::Update.call(
      item:        @item,
      item_params: item_params
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :kind)
  end
end
