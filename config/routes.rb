Rails.application.routes.draw do
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check

  resources :categories, only: [:index, :new, :create, :show] do
    resources :trades, only: [:index, :new, :create, :show]
  end

  # Defines the root path route ("/")
  root to: "home#index" 
end
