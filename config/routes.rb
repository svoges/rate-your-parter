Rails.application.routes.draw do
  root to: 'home#index'
  post '/reviews/:id', to:'reviews#update'
  devise_for :users
  resources :users
  resources :lectures
  resources :reviews
end
