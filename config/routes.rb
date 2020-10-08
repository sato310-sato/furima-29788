Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # resources :users, only: [:edit, :update]
  resources :items, only: [:index, :edit, :new, :show, :create,:destroy,:update] do
    # resources :comment, only: [:create]
    resources :orders, only: [:index, :create]
  end
  
end
