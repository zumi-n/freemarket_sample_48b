class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_parents
  before_action :set_user, except: [:new]

  def index
  end

  def edit
  end

  def register
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_parents
    @parents = Category.limit(14)
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
