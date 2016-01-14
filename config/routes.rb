Rails.application.routes.draw do
  root 'static#home'
  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  post "login", to: "sessions#create"

  resources :users, only: [:new, :create, :index, :show]
  resources :links, only: [:new, :create, :index, :show, :edit, :update]

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :links, only: [:index, :create, :update]
    end
  end

  get "/change_status", to: "links#update"
end
