class Staff::PasswordsController < DeviseTokenAuth::PasswordsController
  include TokenUsable
  prepend_before_action :split_tokens
end
