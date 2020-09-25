Rails.application.routes.draw do
  #どのモデルでユーザーログインしたいか
  devise_for :users
  root to: 'home#index'
  
end
