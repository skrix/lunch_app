# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, except: %i[index new create]
  before_action :check_policy

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Items::Create.call(item_params: item_params)

    return respond_with(@item) unless @item.valid?

    render :show
  end

  def update
    respond_with update_item, location: item_path(@item)
  end

  private

  def check_policy
    authorize(@item || Item)
  end

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
