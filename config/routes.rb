Rails.application.routes.draw do
  root to: 'lectures#index'
  devise_for :users
  resources :users
  resources :lectures
  resources :reviews
end
