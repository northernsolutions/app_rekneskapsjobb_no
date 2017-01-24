Rails.application.routes.draw do

  resources :jobs do
    collection do
      get :search
    end
  end
  resources :employers
  resources :for_employers
  resources :contact
  resources :about

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'jobs#index'
end
