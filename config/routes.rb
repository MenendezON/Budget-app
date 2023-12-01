Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  resources :categories, only: [:index, :new, :create, :show] do
    resources :trades, only: [:index, :new, :create, :show]
  end

  # Defines the root path route ("/")
  root to: "home#index" 
end