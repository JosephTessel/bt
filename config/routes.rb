Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :designs, only: [:index, :show, :new, :create]
  resources :reviews, only: [:index, :show]
  resources :users, only: [:show]
end
