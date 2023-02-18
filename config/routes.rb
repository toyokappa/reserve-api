Rails.application.routes.draw do
  mount_devise_token_auth_for 'Staff', at: 'staff/auth', controllers: {
    sessions: 'staff/sessions',
    token_validations: 'staff/token_validations',
    passwords: 'staff/passwords',
  }
  mount_devise_token_auth_for 'Customer', at: 'customer/auth', controllers: {
    sessions: 'customer/sessions',
    token_validations: 'customer/token_validations',
    passwords: 'customer/passwords',
  }
  as :customer do
    # Define routes for Customer within this block.
  end

  namespace :staff do
    resource :shift, only: %i[show update]
    resources :schedules, only: %i[index]
    resource :profile, only: %i[update]
  end

  namespace :customer do
    resource :reserve, only: %i[show create]
    resource :reserve_schedule, only: %i[show]
    resources :purchases, only: %i[index show create]
    resources :tickets, only: %i[index]
    resources :purchase_histories, only: %i[index show]
    resources :schedules, only: %i[index show destroy]
    resources :notices, only: %i[index]
    resource :card, only: %i[show create update destroy]
    resource :profile, only: %i[update]
  end
end
