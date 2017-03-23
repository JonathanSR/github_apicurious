Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github/callback', to: 'sessions#create'
  get "/repos", to: "repos#index"
  get "/dashboard", to: "dashboard#index"
  get "/logout", to: "sessions#destroy"
  get"/commits", to: "commits#index"
  get"/following", to: "followings#index"
  get "/organizations", to: "organizations#index"
  get"/commits", to: "commits#index"
end
