Rails.application.routes.draw do
  root to: 'home#index'
  post '/reviews/:id', to:'reviews#update'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users
  resources :lectures
  resources :reviews
end