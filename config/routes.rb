Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  root 'static_pages#index'
  ActiveAdmin.routes(self)
  devise_for :users
end
