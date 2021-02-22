Rails.application.routes.draw do

  resources :podcasts
  resources :singles
  # landing
  root 'sessions#landing'
  get '/landingcreator' => 'sessions#landingcreator'
  
  # sessions 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/login-creator' => 'sessions#newcreator'
  post '/login-creator' => 'sessions#createcreator'

  delete '/logout' => 'sessions#destroy'
  delete '/logout-creator' => 'sessions#destroycreator'

  # user
  get '/home' => 'users#home'
  get '/signup' => 'users#new' 

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :users

  # creator
  get '/home-creator' => 'creators#home' 
  get '/signup-creator' => 'creators#new' 

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :creators
  
  # google auth
  get '/auth/:provider/callback' => 'sessions#googlecreate'

  # albums
  # TODO - come back and make sure to remove any routes that you're not using.
  resources :albums

  resources :albums do
    resources :songs, only: [:new, :create, :index]
  end
end
