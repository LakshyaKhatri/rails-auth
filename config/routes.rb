require 'sidekiq/web'

Rails.application.routes.draw do
  # HTML response routes
  root 'admin_dashboard#index'

  scope '/admin', as: :admin do
    get '/dashboard', to: 'admin_dashboard#index'

    get '/login', to: 'session#login'
    post '/login', to: 'session#new'
    get '/logout', to: 'session#logout'

    get '/signup', to: 'registration#new'
    post '/signup', to: 'registration#create'

    scope '/password', as: :password do
      get '/forgot', to: 'password#forgot'
      post '/forgot', to: 'password#create_reset_token'
      get '/reset/:token', to: 'password#reset', as: :reset
      post '/reset/:token', to: 'password#change_password', as: :change
    end

    resources :items, only: [:new, :create]
  end
  #Ask why rsource now working
  resources :shop, only: :index
  resources :cart, only: :index
  resources :order, only: :index

  # API routes
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :items, only: :index

      scope '/cart', as: :cart do
        post '/', to: 'cart#create'
        resources :cart_items
      end

      resources :order, only: :create
    end
  end

  # External appplication routes
  mount Sidekiq::Web => '/sidekiq'
end
