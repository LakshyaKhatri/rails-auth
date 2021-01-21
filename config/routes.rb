Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login', to: 'session#login'
  post '/login', to: 'session#new'
  get '/logout', to: 'session#logout'

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
end
