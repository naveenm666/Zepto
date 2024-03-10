Rails.application.routes.draw do
  get 'carts/show'
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root"home#index"
  resources :products do
  end

  resources :carts do
    post 'add_to_cart/:product_id', action: :add_to_cart, as: :add_to_cart, on: :collection
    post 'increment_cart_quantity', on: :member
    post 'decrement_cart_quantity', on: :member
  end

  get 'all_products', to: 'products#all', as: 'all_products'
  get 'all_categories', to: 'categories#all', as: 'all_categories'

  resources :categories, only: [:show] do
    resources :subcategories, only: [:index]
    resources :products, only: [:index]
  end

  resources :subcategories do
    get 'products', on: :member
  end

  resources :categories do
    resources :subcategories do
      get 'products', on: :member
    end
  end

  get '/account', to: 'home#profile', as: 'account'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
