Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, :path => 'mon_profil'
  resources :carts, :path => 'mon_panier'
  resources :orders, :path => 'commandes'

  resources :items do
    resources :item_pictures, only: [:create, :update, :destroy]
  end

  resources :join_cart_items

  get "/profile", to: "profiles#show", as: "profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
