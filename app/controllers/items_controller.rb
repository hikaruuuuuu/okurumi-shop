class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path, notice: '商品登録が完了しました'
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, images: [])
  end
end
