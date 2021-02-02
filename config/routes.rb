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
  #Use show instead of index
  resources :shop, only: :index
  resources :cart, only: :index
  resources :order, only: :show

  # API routes
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :items, only: :index

      scope '/cart', as: :cart do
        post '/', to: 'cart#create'
        resources :cart_items
      end

      scope '/order', as: :order do
        post '/', to: 'order#create'
        resources :order_items, only: [:index, :create]
      end
    end
  end

  # External appplication routes
  mount Sidekiq::Web => '/sidekiq'
end
