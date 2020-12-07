Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:new,:create,:show]
  resources :sessions,only: [:new,:create,:destroy]
  resources :products
  resources :carts
  resources :cart_items
  resources :orders do
    patch :toggle_status
  end

  patch '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/destroy' => 'carts#delete_item'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
