Rails.application.routes.draw do
  get 'rooms/show'
  root to: 'users#new'
  resources :users, only: [:new,:create,:show,:index]
  resources :sessions,only: [:new,:create,:destroy]
  resources :carts
  resources :cart_items
  resources :products
  resources :favorites, only: [:index,:create,:destroy]
  resources :conversations do
    resources :messages
  end
  get 'rooms/show'

  patch '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/destroy' => 'carts#delete_item'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
