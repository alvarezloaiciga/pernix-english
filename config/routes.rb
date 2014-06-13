PernixEnglish::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  get 'employees/index', to: 'employees#index'
  post 'employees/:id/charge', to: 'employees#charge', as: 'charge_employee'
  get 'badges/index', to: 'badge_nominations#index', as: 'badge_nominations'
  post 'badges/index', to: 'badge_nominations#create', as: 'badge_nominations_create'

  resources :badge_nomination_votes, only: [:create]
end
