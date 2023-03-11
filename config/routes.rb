Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#index"
  resources :books do
    collection do
      get :search
    end
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :records
end
