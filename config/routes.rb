PernixEnglish::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  get 'employees/index', to: 'employees#index'
  post 'employees/:id/charge', to: 'employees#charge', as: 'charge_employee'
end
