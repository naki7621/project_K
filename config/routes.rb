Rails.application.routes.draw do
  devise_for :users
  get 'memos', to: 'memo#index'
end
