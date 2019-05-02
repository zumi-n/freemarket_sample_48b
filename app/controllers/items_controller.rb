class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :confirm, :purchase]
  before_action :set_card, only: [:confirm, :purchase]
  before_action :set_parents, only: [:index, :show]

  def index
    @items = Item.includes(:images).sample(4)
  end

  def show
    @delivery = @item.delivery
  end

  def new
    @item = Item.new
    @item.images.build
    @item.build_delivery
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.json
        format.html { redirect_to root_path }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
  end

  def confirm
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      move_to_create_card
    else
      Payjp.api_key = "sk_test_611af3ae101ec243e28ddd29"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @card_information.brand

      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end

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
    params.require(:item).permit(:id, :name, :description, :brand, :size, :condition, :price, :category_id, images_attributes:[:id, :item_id, {file: []}], delivery_attributes:[:id, :payer, :method, :area, :date]).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:image).permit(:id, :item_id, {file: []})
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def set_parents
    @parents = Category.limit(14)
  end

  def move_to_create_card
    redirect_to new_card_path(user_id: current_user.id)
  end

end
