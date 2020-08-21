Rails.application.routes.draw do
  get "/users"=>"users#index"
  root 'posts#index'
  # resources :posts
  # resources :tags
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :tags
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end