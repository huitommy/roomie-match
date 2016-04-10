Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :preferences, only: [:new, :create]
end
