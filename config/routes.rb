Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login', to: 'session#login'
  post '/login', to: 'session#new'

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'

  get '/logout', to: 'session#logout'
end
