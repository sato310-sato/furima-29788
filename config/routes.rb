Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # resources :users, only: [:edit, :update]
  resources :items, only: [:index, :edit, :new, :show, :create]
  # oder作成後
  #resources :oder, only: [: , :]
end
