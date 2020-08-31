Rails.application.routes.draw do
  root 'sessions#index'
  
  get '/auth/google_oauth2/callback', to: 'sessions#create_omniauth'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/signup', to: 'users#new'

  delete '/logout', to: 'sessions#destroy'

  get '/how_to_use', to: 'users#how_to_use'

  # resources :garages
  resources :reviews, only: [:index, :show, :new, :create]
  resources :karts do
    resources :reviews, only: [:new, :index]
  end
  resources :users, only: [:show, :new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
