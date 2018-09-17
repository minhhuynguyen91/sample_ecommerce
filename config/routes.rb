Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'

  resources :products
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  get '/cart', to: 'carts#show'
  put 'add/:product_id', to: 'carts#add', as: :add_to
  put 'remove/:product_id', to: 'carts#remove', as: :remove_from

  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
