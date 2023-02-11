class Customer::ApplicationController < ApplicationController
  before_action :split_tokens
  before_action :authenticate_customer!, unless: :devise_controller?
end
