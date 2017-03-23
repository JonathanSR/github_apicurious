Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github/callback', to: 'sessions#create'
  get "/repos", to: "repos#index"
  get "/dashboard", to: "dashboard#index"
  get "/logout", to: "sessions#destroy"
#  resources :dashboard, only: [:index]
end
