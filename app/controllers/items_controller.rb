class ItemsController < ApplicationController
  def new
    @item = Item.new
    # @item.images.build
    @item.build_image
    @item.build_delivery
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  before_action :set_item, only: [:edit, :update,:show, :confirm]

  def index
    @items = Item.includes(:images).sample(4)
  end


  def show
  end

  def confirm
  end

  def edit
    @item.image = Image.new
    @item.delivery = Delivery.new
  end

  def update
    @item.update(item_params)
    binding.pry

  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :description, :brand, :size, :condition, :price, :category_id, image_attributes:[:id, :item_id, {file: []}], delivery_attributes:[:id, :payer, :method, :area, :date]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
