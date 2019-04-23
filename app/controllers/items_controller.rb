class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).sample(4)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @profile = Profile.find(params[:id])
    @delivery = Delivery.find(params[:id])
  end

  def confirm
    @item = Item.find(params[:id])
  end

end
