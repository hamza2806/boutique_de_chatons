Rails.application.routes.draw do
  devise_for :users
  resources :carts
  resources :orders
  resources :items do
    resources :item_pictures, only: [:create]
  end

  post "/orders", to: "orders#create", as: "buy"
  get "/profiles/:id", to: "profiles#show", as: "profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
