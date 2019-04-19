class UsersController < ApplicationController

  def register
  end

  def logout
  end

    private

  def user_params
    params.require(:user).permit(:name, :email)
  end


end



