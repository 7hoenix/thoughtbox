Rails.application.routes.draw do
  root 'static#home'
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "links", to: "users#show"

  resources :users, only: [:new, :create, :index, :show]
end
