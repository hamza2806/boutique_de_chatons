Rails.application.routes.draw do
  devise_for :users

  resources :carts
  resources :orders

  resources :items

  post "/orders", to: "orders#create", as: "buy"
  post "/carts", to: "carts#create", as: "cart_create"
  get "/profiles/:id", to: "profiles#show", as: "profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
