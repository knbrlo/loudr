Rails.application.routes.draw do

  # root
  root 'sessions#home'

  # sign up
  get '/signup' => 'users#new' 
  get '/signup-creator' => 'creators#new' 

  # login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # user
  get '/user-home' => 'users#home'
  delete '/user-logout' => 'sessions#destroyuser'

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :users

  # creator
  get '/creator-home' => 'creators#home' 
  delete '/creator-logout' => 'sessions#destroycreator'

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :creators

  # contents
  # TODO - come back and make sure to remove any routes that you're not using.
  resources :contents

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
