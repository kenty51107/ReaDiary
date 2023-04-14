Rails.application.routes.draw do
  # devise_for :users
  root to: "static_pages#index"
  resources :books do
    collection do
      get :search
      get :detail
    end
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'devise/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :users do
    member do
      get :finished_books
    end
  end
  resources :records
  resources :replies
  resources :relationships do
    member do
      get :followings
      get :followers
    end
  end
end
