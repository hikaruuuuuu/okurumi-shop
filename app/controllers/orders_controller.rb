class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    UserInfo.create(user_info_params)
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  private

  def  user_info_params
    params.require(:order).permit(:first_name, :last_name, :post_code, :prefecture_id, :address, :building_number, :building_name, :phone_number)
  end
end
