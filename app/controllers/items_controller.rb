class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :status_id, :shipping_id, :shipment_source_id, :shipping_day_id, :category_id)
  end

end
