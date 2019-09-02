Rails.application.routes.draw do


  get 'order/index'
resources :carts

  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
