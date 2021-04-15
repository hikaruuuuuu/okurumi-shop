class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @userInfo = UserInfo.new(user_info_params)
    @order = Order.new(order_params)
    if @order.valid? && @userInfo.valid?
      @userInfo.save
      @order.save
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
    else
      render :index
    end
  end

  private

  def  user_info_params
    params.require(:order).permit(:first_name, :last_name, :post_code, :prefecture_id, :address, :building_number, :building_name, :phone_number)
  end

  def order_params
    params.permit(:item_id).merge(user_info_id: @userInfo.id)
  end
end
