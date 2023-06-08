Rails.application.routes.draw do
  resources :posts
  resources :sessions
  resources :users

  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
end
