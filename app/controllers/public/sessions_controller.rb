# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only:[:create]
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

  protected

  def customer_state
    # Customerモデルに該当するemailのアカウントが存在するかを検索
    # モデル名.find_by(カラム名: 検索する値)
    @customer = Customer.find_by(email: params[:customer][:email])

    # 上記が存在している場合、そのアカウントのPWとログイン画面で入力されたPWが一致しているかを確認
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted == false
    else
      redirect_to new_customer_registration_path
    end
  end
end
