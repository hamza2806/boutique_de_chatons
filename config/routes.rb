Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users

  resources :carts
  resources :orders
  resources :join_cart_items
  resources :items

  post "/orders", to: "orders#create", as: "buy"
  get "/profiles/:id", to: "profiles#show", as: "profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
