Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login', to: 'session#login'
  post '/login', to: 'session#new'
end
