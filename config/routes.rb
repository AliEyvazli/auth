Rails.application.routes.draw do
  resources :posts
  resources :sessions
  resources :users

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
end