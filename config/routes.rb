PernixEnglish::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  post 'employees/:id/charge', to: 'employees#charge', as: 'charge_employee'
  get 'badges/index', to: 'badge_nominations#index', as: 'badge_nominations'
end
