Rails.application.routes.draw do

  # root
  root 'sessions#landing'
  
  # sessions 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/login-creator' => 'sessions#newcreator'
  post '/login-creator' => 'sessions#createcreator'

  delete '/logout' => 'sessions#destroy'
  delete '/logout-creator' => 'sessions#destroycreator'

  # sessions - additional
  get '/landingcreator' => 'sessions#landingcreator'


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

  # recents
  # TODO - come back and make sure to remove any routes that you're not using.
  resources :recents

end
