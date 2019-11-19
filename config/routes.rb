Rails.application.routes.draw do
  resources :order_products
  resources :products
  resources :orders
  resources :users
  # , only: [:create]

  get '/cart/:id', to: 'orders#user_cart'
  get '/cart', to: 'orders#user_cart_id'
  
  post '/login', to: 'auth#create'

  get '/profile', to: 'users#profile'
  get '/myorders', to: 'orders#user_orders'
  get '/myorderproducts/:order_id', to: 'order_products#user_order_products'
end
