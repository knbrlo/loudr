Rails.application.routes.draw do

  # root
  root 'sessions#home'
  
  # user
  get '/home' => 'users#home'

  get '/signup' => 'users#new' 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :users

  # creator
  get '/home-creator' => 'creators#home' 

  get '/signup-creator' => 'creators#new' 
  
  get '/login-creator' => 'sessions#newcreator'
  post '/login-creator' => 'sessions#createcreator'
  
  delete '/logout-creator' => 'sessions#destroycreator'

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :creators

  
  # TODO - come back and make sure to remove any routes that you're not using.
  resources :albums

  # recents
  # TODO - come back and make sure to remove any routes that you're not using.
  resources :recents

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
