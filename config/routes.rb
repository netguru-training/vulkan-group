Rails.application.routes.draw do
<<<<<<< HEAD
  root 'static_pages#index'
=======
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
>>>>>>> Active admin basic config
  devise_for :users
end
