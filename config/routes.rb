 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :djcats
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
  resources :orders do
    resources:orderitems
  end
  
  
  
  devise_for :users do
    resources:orders
  end
  
  get '/checkout' => 'cart#createOrder' # Allows us to call the createOrder method when we press the button
   
  get 'cart/index'
  
  
  resources :items
  root 'static_pages#home'
  get '/help' =>'static_pages#help'
  get '/about' =>'static_pages#about'
  
  get '/login' =>'user#login'
  get '/logout' =>'user#logout'
  
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'  # => is the same as using  , to
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart' => 'cart#index'
  get '/paid/:id' => 'static_pages#paid'
  
  post '/search' => 'items#search'
  
  get '/cart/decrease/:id' => 'cart#decrease'
  
  
  root :to => 'site#home'
end
