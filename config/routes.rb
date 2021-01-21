Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login', to: 'session#login'
  post '/login', to: 'session#new'
  get '/logout', to: 'session#logout'

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'

  get 'password/forgot', to: 'password#forgot'
  post 'password/forgot', to: 'password#create_reset_token'
  post 'password/reset/:token', to: 'password#reset'
end
