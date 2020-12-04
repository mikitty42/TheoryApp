Rails.application.routes.draw do
  get 'cart_items/destroy'
  resources :users, only: [:new,:create,:show]
  resources :sessions,only: [:new,:create,:destroy]
end
