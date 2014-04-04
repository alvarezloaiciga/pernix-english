PernixEnglish::Application.routes.draw do
  root 'home#index'

  post 'employees/charge', to: 'employees#charge'
end
