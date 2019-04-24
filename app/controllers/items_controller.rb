class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :confirm]

  def index
    @items = Item.includes(:images).sample(4)
  end

  def new
  end

  def show
    @profile = Profile.find(params[:id])
    @delivery = Delivery.find(params[:id])
  end

  def confirm
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
