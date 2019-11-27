Rails.application.routes.draw do
  resources :websites
  resources :skills
  resources :projects
  resources :educations
  resources :work_experiences
  resources :addresses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
