Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
end
