class ProfilesController < ApplicationController
  before_action :set_profile
  before_action :set_parents

  def index
  end

  def edit
  end

  private

  def set_parents
    @parents = Category.limit(14)
  end

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end
end