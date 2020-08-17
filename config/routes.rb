Rails.application.routes.draw do
  root 'sessions#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/signup', to: 'users#new'

  delete '/logout', to: 'sessions#destroy'

  resources :garages
  resources :reviews
  resources :karts do
    resources :reviews, only: [:new, :index]
  end
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
