Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'users/:id/account', to: 'users#show', as: :user_account

  root to: 'sessions#new'

  resources :users, except: :index do
    resources :ideas
  end

  namespace :admin do
    resources :categories
  end
end
