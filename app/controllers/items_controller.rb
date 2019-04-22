class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:images).sample(4)
  end

  def new
  end

  def show
  end

  def confirm
  end

end
