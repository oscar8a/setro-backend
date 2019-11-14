Rails.application.routes.draw do
  resources :order_products
  resources :products
  resources :orders
  resources :users
  # , only: [:create]

  # post '/cart', to 'orders#user_order'
  
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
