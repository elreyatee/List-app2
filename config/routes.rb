Rails.application.routes.draw do

  root to: 'lists#index'

  get '/register', to: 'users#new'
  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy'
  get '/delete/:id', to: 'lists#destroy', as: 'delete'

  resources :users, only: [:new, :create, :edit, :update]

  resources :lists, only: [:index, :show, :new, :create, :edit, :update] do
    resources :items, only: [:create]
  end

end
