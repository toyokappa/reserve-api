Rails.application.routes.draw do
  mount_devise_token_auth_for 'Staff', at: 'staff/auth', controllers: {
    registrations: 'admin/staff/registrations',
    sessions: 'staff/sessions',
    token_validations: 'staff/token_validations',
    passwords: 'staff/passwords',
  }
  mount_devise_token_auth_for 'Customer', at: 'customer/auth', controllers: {
    registrations: 'customer/registrations',
    confirmations: 'customer/confirmations',
    sessions: 'customer/sessions',
    token_validations: 'customer/token_validations',
    passwords: 'customer/passwords',
  }
  as :customer do
    # Define routes for Customer within this block.
  end

  namespace :admin, format: 'json' do
    resources :customers, only: %i[index show]
    resource :customer_group, only: %i[create destroy]
    resources :staffs, only: %i[index show update destroy]
    resources :programs, only: %i[index show]
    resource :program_staff, only: %i[create destroy]
  end

  namespace :staff, format: 'json' do
    resource :shift, only: %i[show update]
    resources :schedules, only: %i[index]
    resource :profile, only: %i[update]
    resources :customers, only: %i[index show]
    resources :kartes, only: %i[index create]
  end

  namespace :customer, format: 'json' do
    resource :reserve, only: %i[show create]
    resource :reserve_schedule, only: %i[show]
    resources :purchases, only: %i[index show create]
    resources :tickets, only: %i[index]
    resources :purchase_histories, only: %i[index show]
    resources :schedules, only: %i[index show destroy]
    resource :card, only: %i[show create update destroy]
    resource :profile, only: %i[update]
    resource :coupon, only: %i[show]
  end
end
