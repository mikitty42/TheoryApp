Rails.application.routes.draw do
  resources :users, only: [:new,:create,:show]
  resources :sessions,only: [:new,:create,:destroy]
  resources :products
  resources :carts
  resources :cart_items
  resources :orders do
    patch :toggle_status
  end
end
