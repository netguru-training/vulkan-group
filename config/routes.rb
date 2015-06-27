Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  root 'static_pages#index'
  ActiveAdmin.routes(self)
  devise_for :users
end
