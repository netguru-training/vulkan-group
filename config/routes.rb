Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end
  resource :cart, only: [:show]

  resources :orders, only: [:new, :create, :destroy]

  post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'

  root 'static_pages#index'
  ActiveAdmin.routes(self)

  get 'search', to: 'search#search'
end
