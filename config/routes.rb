Rails.application.routes.draw do

  root to: 'users#new'
  resources :users
  resources :sessions,only: [:new,:create,:destroy]
  resources :carts
  resources :cart_items
  resources :products do
    get :search, on: :collection
  end
  resources :favorites, only: [:index,:create,:destroy]
  resources :conversations do
    resources :messages
  end
  resources :orders do
    patch :toggle_status
  end
  get  "samples/index"  => "samples#index"
  get 'rooms/show'
  root 'rooms#show'
  patch '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/destroy' => 'carts#delete_item'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
