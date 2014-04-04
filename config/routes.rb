PernixEnglish::Application.routes.draw do
  root 'home#index'

  post 'employees/:id/charge', to: 'employees#charge', as: 'charge_employee'
end
