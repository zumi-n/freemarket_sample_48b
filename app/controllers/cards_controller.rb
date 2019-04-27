class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: 2)#current_user.id)
    redirect_to action: "index" if card.exists?
  end

  def pay #PayjpとCardのデータベースを作成
    # TODO user機能実装後に反映
    Payjp.api_key = 'sk_test_611af3ae101ec243e28ddd29'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: User.find(2).email,
        # TODO user機能実装後に反映
        # email: current_user.email,
        card: params['payjp-token'],
        # metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: 2, customer_id: customer.id, card_id: customer.default_card)
      # TODO user機能実装後に反映
      # @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardのデータベースを削除
    card = Card.where(user_id: 2).first
    # TODO user機能実装後に反映
    # card = Card.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = "
      sk_test_611af3ae101ec243e28ddd29"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer .delete
      card.delete
    end
    redirect_to action: "new"
  end

  def index #CardのデータをPayjpに送って情報を取り出す
    card = Card.where(user_id: 2).first
    #TODO ユーザー機能実装後反映
    # card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = "sk_test_611af3ae101ec243e28ddd29"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
