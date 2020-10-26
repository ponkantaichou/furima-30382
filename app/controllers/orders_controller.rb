class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
 
  def new
  end
 
  def create
    @order = Order.new(order_params)
    @order.save
    @address = Address.new(address_params)
    @order.save
  end
 
  private
  def address_params
   params.require(:order).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(order_id: @order.id)
  end

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id) 
  end
end
