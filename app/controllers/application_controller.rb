class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :delete_user, if: :user_signed_in?


  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name,:first_name,:family_name_kana,:first_name_kana,:birthday_year,:birthday_month,:birthday_day,:user_id])
  end
  def delete_user
    @registrations = User.find(current_user.id)
    @registrations.destroy unless Address.where(user_id: current_user.id).exists? && Phonenumber.where(user_id: current_user.id).exists?

  end
end
