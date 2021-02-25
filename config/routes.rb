Rails.application.routes.draw do

  root 'sessions#landing'
  get '/landingcreator' => 'sessions#landingcreator'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/login-creator' => 'sessions#newcreator'
  post '/login-creator' => 'sessions#createcreator'
  delete '/logout' => 'sessions#destroy'
  delete '/logout-creator' => 'sessions#destroycreator'
  get '/home' => 'users#home'
  get '/signup' => 'users#new' 
  get '/home-creator' => 'creators#home' 
  get '/signup-creator' => 'creators#new' 
  get '/auth/:provider/callback' => 'sessions#googlecreate'

  resources :users
  resources :creators
  resources :albums
  resources :podcasts
  resources :singles
  
  resources :songs, only: [:index, :show]

  resources :albums do
    resources :songs, only: [:new, :create, :index, :show]
  end
end