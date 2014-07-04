PernixEnglish::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  get 'employees/index', to: 'employees#index'
  post 'employees/:id/charge', to: 'employees#charge', as: 'charge_employee'
  resources :badge_nominations, only: [:index, :create] do
    resource :badge_nomination_votes, only: :create
  end
  get 'badge_nomination_votes/results', to: 'badge_nomination_votes#results', as: 'votes_results'
end
