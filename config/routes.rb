Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root"home#index"
  resources :products do
    post :add_to_cart, on: :member
    post :increment_cart_quantity, on: :member
    post :decrement_cart_quantity, on: :member
  end
  get 'all_products', to: 'products#all', as: 'all_products'
  get 'all_categories', to: 'categories#all', as: 'all_categories'

  resources :categories do
    resources :subcategories
  end

  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
