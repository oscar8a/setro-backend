Rails.application.routes.draw do
  resources :order_products
  resources :products
  resources :orders
  resources :users
  # , only: [:create]

  get '/cart', to: 'orders#user_cart'
  
  post '/login', to: 'auth#create'

  get '/profile', to: 'users#profile'
  get '/myorders', to: 'orders#user_orders'
  get '/myorderproducts', to: 'order_products#user_order_products'
end
