Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  unauthenticated :user do
    root to: "welcome#index", as: "unauthenticated_root"
  end

  authenticated :user do
    root to: "home#index", as: "authenticated_root"
  end

  resources :selector, only: [:index]
  resources :preferences, only: [:new, :create, :edit, :update]
  resources :dwellings
end
