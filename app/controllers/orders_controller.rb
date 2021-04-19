class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      @user_order.save
      pay_item
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def  user_order_params
    params.require(:user_order).permit(:first_name, :last_name, :post_code, :prefecture_id, :address, :building_number, :building_name, :phone_number).merge(item_id: params[:item_id])
  end

end
