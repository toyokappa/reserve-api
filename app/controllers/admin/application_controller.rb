class Admin::ApplicationController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['BASIC_USER'] && pass == ENV['BASIC_PASS']
    end
  end
end
