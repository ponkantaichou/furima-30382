class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
   
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :status_id, :shipping_id, :shipment_source_id, :shipping_day_id, :category_id, :image).merge(user_id: current_user.id)
  end

end
