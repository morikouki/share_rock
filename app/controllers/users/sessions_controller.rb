# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  before_action :reject_user, only: [:create]

  before_action :configure_permitted_parameters, if: :devise_controller?

  #ユーザーログイン後のページ
  def after_sign_in_path_for(resource)
    user_events_path
  end

  #ユーザーログアウト後のページ
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  
  def reject_user
    #入力されたメールアドレスに対応するユーザーが存在する確認
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      #入力されたパスワードが正しいか確認し、is_deletedカラムが会員の場合ログイン画面へ遷移
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end
