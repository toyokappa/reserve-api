class Customer::PasswordsController < DeviseOverride::PasswordsController
  include TokenUsable
  prepend_before_action :split_tokens
end
