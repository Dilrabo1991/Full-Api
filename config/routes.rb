Rails.application.routes.draw do
  resources :commerces
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :customers, only: [:create]
  post "/login", to: "customers#login"
end
