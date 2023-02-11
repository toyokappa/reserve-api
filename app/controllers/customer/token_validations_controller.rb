class Customer::TokenValidationsController < DeviseTokenAuth::TokenValidationsController
  include TokenUsable
  prepend_before_action :split_tokens
end
