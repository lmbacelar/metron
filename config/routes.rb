Rails.application.routes.draw do
  root to: 'instruments#index'
  resources :instruments
end
