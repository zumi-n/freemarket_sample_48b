class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm, :purchase]
  before_action :set_card, only: [:confirm, :purchase]

  def index
    @items = Item.includes(:images).sample(4)
  end

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


  def show
    # @profile = Profile.find(params[:id])
    @delivery = @item.delivery
  end

  def confirm
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      move_to_create_card
    else
      Payjp.api_key = "sk_test_611af3ae101ec243e28ddd29"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  require 'payjp'

  def purchase
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :brand, :size, :condition, :price, :category_id, images_attributes:[:item_id, {file: []}], delivery_attributes:[:payer, :method, :area, :date]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def move_to_create_card
    redirect_to new_card_path(user_id: current_user.id)
  end

end
