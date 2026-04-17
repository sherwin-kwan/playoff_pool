Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'main#index'

  # Users

  resources :users, only: %i[new create show edit update]
  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create", as: :login_submit
  get "/logout" => "sessions#destroy", as: :logout
  # Callback (redirect after successful auth) - this must match the Google Cloud Console redirect URL
  # This is the default path set in the omniauth gem
  get '/auth/google_oauth2/callback', to: 'sessions#google_callback'
  get '/auth/failure',                to: 'sessions#oauth_failure'

  # Predictions 
  
  resources :series
  resources :predictions, except: %i[new create]
  resources :rounds, only: [:show]
  resources :teams, only: %i[index show]
  resources :notes, only: %i[index show]
  get "/rules" => "pages#rules", as: :rules
  get '/results/:year' => "results#show", as: :previous_results
  get "/series/:id/new_prediction" => "predictions#new", as: :new_prediction
  post "/series/:id/create_prediction" => "predictions#create", as: :create_prediction
  get "/round/:id/new_prediction" => "predictions#new_by_round", as: :new_round_prediction
  post "/predictions_by_round" => "predictions#create_by_round", as: :create_round_prediction
end
