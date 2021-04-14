class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    UserInfo.create(user_info_params)
  end

  private

  def  user_info_params
    params.require(:order).permit(:first_name, :last_name, :post_code, :prefecture_id, :address, :building_number, :building_name, :phone_number)
  end
end
