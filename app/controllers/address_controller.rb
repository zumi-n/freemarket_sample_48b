class AddressController < ApplicationController
  skip_before_action :delete_user
  before_action :move_to_root,unless: :user_signed_in?
  def new
    @address=Address.new
  end

  def create
    @address=Address.new(address_params)
    if @address.save
      redirect_to new_creditcard_path
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code,:prefecture,:city,:street_address,:building,:telnumber).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path
  end

end
