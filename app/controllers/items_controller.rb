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
      redirect_to root_path, notice: '商品登録が完了しました'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, images: [])
  end
end
