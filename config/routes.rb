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
  get '/shop', to: 'shop#index'
  get '/cart', to: 'cart#index'

  # External appplication routes
  mount Sidekiq::Web => '/sidekiq'

  # API routes
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/items', to: 'items#list'

      scope '/cart', as: :cart do
        post '/add-item', to: 'cart#add_item'
        post '/remove-item', to: 'cart#remove_item'
        post '/item-exists', to: 'cart#item_exists'
        post '/increase-qty', to: 'cart#increase_qty'
        post '/decrease-qty', to: 'cart#decrease_qty'
      end
    end
  end
end
