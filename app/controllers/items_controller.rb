class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.build
    @item.build_delivery
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def index
  end

  def show
  end

  def confirm
  end


  private

  def item_params
    params.require(:item).permit(:name, :desctiption, :brand, :size, :condition, :price, :profit, images_attributes:[:image], delivery_attributes:[:burden, :method, :area, :date])
  end

end
