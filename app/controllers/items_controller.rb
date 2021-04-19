class ItemsController < ApplicationController
  before_action :if_not_admin, except: [:index]

  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品登録が完了しました'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, images: [])
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
