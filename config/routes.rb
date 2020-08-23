Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "/users"=>"users#index"
  root 'posts#index'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy] 
  end
  resources :tags
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end