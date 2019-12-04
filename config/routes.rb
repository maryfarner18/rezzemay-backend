Rails.application.routes.draw do
  resources :users, only: %i[create show update destroy]

  # sessions

  # post '/signup', to: 'users#create'
  
  post '/login', to: 'auth#create'
  delete '/logout', to: 'auth#destroy'

  # get '/logged_in', to: 'sessions#is_logged_in?'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
