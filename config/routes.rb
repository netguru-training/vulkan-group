Rails.application.routes.draw do
  root 'static_pages#index'
  ActiveAdmin.routes(self)
  devise_for :users
end
