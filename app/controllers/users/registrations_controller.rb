# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   #before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
   #prepend_before_action :check_captcha, only: [:create]
  # GET /resource/sign_up


  def registration
    # unless session[:user] == nil
    #   @user = User.new(session[:user])
    #   nickname = @user.nickname
    #   email = @user.email
    # end
    @user = User.new(session[:user])
    nickname = @user.nickname
    email = @user.email

  end

  def tel
    session[:nickname] = params[:session][:nickname]
    session[:email] = params[:session][:email]
    session[:password] = params[:session][:password]
    session[:password_confirmation] = params[:session][:password_confirmation]
    session[:family_name] = params[:session][:family_name]
    session[:first_name] = params[:session][:first_name]
    session[:family_name_kana] = params[:session][:family_name_kana]
    session[:first_name_kana] = params[:session][:first_name_kana]
    # 誕生日
    birth_year = params[:session][:"birthday_data(1i)"].to_i
    birth_month = params[:session][:"birthday_data(2i)"].to_i
    birth_day = params[:session][:"birthday_data(3i)"].to_i
    unless birth_year == 0 || birth_month == 0 || birth_day == 0
      session[:birthday_data] = Date.new(birth_year, birth_month , birth_day)
    end

  end

  def address
    session[:phone_number] = params[:session][:phone_number]
  end

  def credit
  end


  def done
  end

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    session[:postal_code] = params[:session][:postal_code]
    session[:prefecture] = params[:session][:prefecture]
    session[:city] = params[:session][:city]
    session[:street_address] = params[:session][:street_address]
    session[:building] = params[:session][:building]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_data: session[:birthday_data],
      phone_number: session[:phone_number]
      )

    @user.address = @user.build_address(
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      city: session[:city],
      street_address: session[:street_address],
      building: session[:building]
      )

    @user.save


    #deviseで新規登録を行うと自動でアカウントが切り替わる問題解決
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(@user, current_user)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      render action: :registration
      clean_up_passwords resource
      set_minimum_password_length
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.



 private

  def after_sign_up_path_for(resource)
    sign_up_done_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    sign_up_done_path
  end


  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    respond_with_navigational(resource) { render :new } unless verify_recaptcha(model: resource)
  end



  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
