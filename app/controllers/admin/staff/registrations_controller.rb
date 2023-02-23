class Admin::Staff::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :basic_auth

  private

  def sign_up_params
    params.require(:sign_up).permit(
      :last_name,
      :first_name,
      :display_name,
      :image,
      :comment,
      :email,
      :password,
    )
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['BASIC_USER'] && pass == ENV['BASIC_PASS']
    end
  end
end