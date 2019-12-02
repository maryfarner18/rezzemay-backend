Rails.application.routes.draw do
  resources :websites, only: [:show, :create]
  resources :skills, only: [:show, :create]
  resources :projects, only: [:show, :create]
  resources :educations, only: [:show, :create]
  resources :work_experiences, only: [:show, :create]
  resources :addresses, only: [:show, :create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
