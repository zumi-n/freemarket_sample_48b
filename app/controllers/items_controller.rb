class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.build
    @item.build_delivery
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :root
    else
      render :new
    end
  end


  before_action :set_item, only: [:show, :confirm, :purchase]

  def index
    @items = Item.includes(:images).sample(4)
  end


  def show
    # @profile = Profile.find(params[:id])
    @delivery = Delivery.find(params[:id])
  end

  def confirm
  end

  require 'payjp'

  def purchase
    customer_id = Card.find(user_id: 2).first.customer_id
    # TODO ログイン機能実装後反映
    # customer = Card.find(user_id: current_user.id)
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_id,
      currency: 'jpy'
    )
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :size, :condition, :price, :category_id, images_attributes:[:item_id, {file: []}], delivery_attributes:[:payer, :method, :area, :date])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
