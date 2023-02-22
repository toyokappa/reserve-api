class Customer::ConfirmationsController < DeviseOverride::ConfirmationsController
  include TokenUsable
  prepend_before_action :split_tokens
end