Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'sessions#new'

  resources :users do
    resources :ideas
  end

  namespace :admin do
    resources :categories
  end
end
