Rails.application.routes.draw do

  # root
  root 'sessions#home'

  # sign up
  get '/signup' => 'users#new' 
  get '/signup-creator' => 'creators#new' 

  # login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :users

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :contents

  # TODO - come back and make sure to remove any routes that you're not using.
  resources :creators

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
