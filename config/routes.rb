Rails.application.routes.draw do
 
  post 'user_token' => 'user_token#create'
  # Session Form
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'

  #Get the login token from Knock
  post 'user_token' => 'user_token#create'

  #User routes
  get '/users/current' => 'users#current'

  root :to => "pages#home"
  resources :users
  get '/products/:id/delete' => 'products#destroy', as: 'destroy_product'
  resources :products
  resources :categories
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :cart

  #Cart Routes
  get '/api/cart' => 'api_cart_line_items#index'
  # post '/api/cart' => 'api_cart_line_items#add_qty', as: 'add_qty'

  post '/api/cart/update_qty/:product_id'  => 'api_cart_line_items#update_qty', as: 'update_cart_qty'
  
  post '/api/cart/add/:product_id' => 'api_cart_line_items#add', as: 'add_item'
  
  delete '/api/cart/destroy/:product_id'  => 'api_cart_line_items#destroy', as: 'delete_line_item'

  post '/api/order/add/:cart_line_items_id' => 'api_order_line_items#add', as: 'add_order_line_items'

  get '/api/order/:order_line_items_id' => 'api_order_line_items#index', as: 'index_order_line_items'

  
  # these are all API routes for the React frontend
  get '/api/products' => 'api_products#index'
  get '/api/products/:id' =>  'api_products#show'

end
