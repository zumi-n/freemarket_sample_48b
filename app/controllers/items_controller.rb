class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.build
    @item.build_delivery
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html
        format.json
      end
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def confirm
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :size, :condition, :price, :profit, images_attributes:[:item_id, :file], delivery_attributes:[:payer, :method, :area, :date]).merge(user_id: 1,profit: '10')
  end

end
