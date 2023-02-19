class Customer::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.require(:sign_up).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birthday,
      :tel,
      :postcode,
      :address,
      :email,
      :password,
      :password_confirmation,
    )
  end
end