class Staff::ApplicationController < ApplicationController
  before_action :split_tokens
  before_action :authenticate_staff!, unless: :devise_controller?
end
