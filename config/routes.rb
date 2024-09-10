Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :homes

  resources :memos, only: [:new, :create]
  resources :books, only: [:new, :create]
end