Rails.application.routes.draw do
  resources :games
  get 'static_pages/home'
  resources :teams
  resources :tournaments
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root 'application#hello'
  #root   'tournaments#index'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
end
