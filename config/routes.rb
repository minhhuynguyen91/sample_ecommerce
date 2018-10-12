Rails.application.routes.draw do
  get 'contacts/new'
  get 'products/index'
  get 'products/show'
  
  
  resources :products
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  get '/cart', to: 'carts#show'
  put 'add/:product_id', to: 'carts#add', as: :add_to_cart
  put 'remove/:product_id', to: 'carts#remove', as: :remove_from_cart

  root 'homes#index'
  get '/contact', to: 'homes#contact'
  post '/contact', to: 'contacts#create'
  # get '/about_me', to: 'homes#about_me'
  
  get '/en', to: 'set_language#en'
  get '/vi', to: 'set_language#vi'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
