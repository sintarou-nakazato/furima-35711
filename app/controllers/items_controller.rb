class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :cost_id, :area_id, :day_id, :price, :image)
  end
end
