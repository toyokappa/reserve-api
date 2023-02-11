class Customer::SessionsController < DeviseTokenAuth::SessionsController
  include TokenUsable
  prepend_after_action :join_tokens, only: [:create]
end
