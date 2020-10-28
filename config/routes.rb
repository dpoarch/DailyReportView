Rails.application.routes.draw do
  get 'home/Index'
  get '/orders' => 'orders#index', as: :orders
  post '/orders/fulfillorder/:id' => 'orders#fulfillorder', as: :fulfillorder

  get '/locations' => 'locations#index'

  get '/products' => 'products#index', as: :products
  #get '/products/:id' => 'products#show', as: :product
  get '/products/new' => 'products#new', as: :new_product
  post '/products/create' => 'products#create', as: :create_product
  get '/products/edit/:id' => 'products#edit', as: :edit_product
  patch '/products/update/:id' => 'products#update', as: :update_product
  delete '/products/destroy/:id' => 'products#destroy', as: :destroy_product

  get '/carts' => 'cart#index', as: :carts
  post '/carts/addcart/:id' => 'cart#addcart', as: :addcart
  get '/carts/homecart' => 'cart#homecart', as: :homecart
  get '/carts/new/' => 'cart#new', as: :new_cart
  post '/carts/create/' => 'cart#create', as: :create_cart
  post '/carts/checkout'=> 'cart#checkout', as: :checkout_cart
  delete '/carts/destroy/' => 'cart#destroy', as: :destroy_cart
  delete '/carts/destroyhomecart/:id' => 'cart#destroyhomecart', as: :destroyhomecart


  get '/home' => 'home#index', as: :home
  get '/home/dashboard' => 'home#dashboard', as: :dashboard_home

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
