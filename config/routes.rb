Rails.application.routes.draw do
  get 'predictions/new'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'main#index'

  # Users

  resources :users, only: %i[new create]
  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create", as: :login_submit
  get "/logout" => "sessions#destroy", as: :logout

  # Predictions 
  
  resources :predictions
end
