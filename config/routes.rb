Rails.application.routes.draw do
  resources :user_sessions
  resources :users
  resources :instruments

  get 'login'   => 'user_sessions#new',     as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

  root to: 'instruments#index'
end
