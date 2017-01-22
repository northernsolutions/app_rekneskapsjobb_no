Rails.application.routes.draw do

  resources :jobs
  resources :employers
  resources :for_employers
  resources :contact
  resources :about

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'landing#index'
end
