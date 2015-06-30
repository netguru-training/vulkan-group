Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  resource :cart, only: [:show] do
  end

  resources :orders, only: [:new, :create, :destroy] do
    resource :transaction, only: [:new, :create]
  end

  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  post '/decrement_from_cart/:product_id' => 'carts#decrement_from_cart', :as => 'decrement_from_cart'
  post '/delete_from_cart/:product_id' => 'carts#delete_from_cart', :as => 'delete_from_cart'

  root 'static_pages#index'
  ActiveAdmin.routes(self)

  get 'search', to: 'search#search'
end
