class UsersController < ApplicationController

  def show
    # @nickname = current_user.nickname
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
    redirect_to edit_user_path, flash.now[:notice] = "変更しました。"
  end

    private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
