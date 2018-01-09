Rails.application.routes.draw do

  root 'tasks#index'
  devise_for :users
  resources :tasks
  resources :categories, only: [:index]

end
