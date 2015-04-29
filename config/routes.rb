Rails.application.routes.draw do

  root to: 'lists#index'

  get '/register', to: 'users#new'
  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update]

  resources :lists do
    resources :items, only: [:create]
  end

end
