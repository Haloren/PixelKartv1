Rails.application.routes.draw do
  root 'sessions#index'
    # if logged_in?
    #   redirect_to users_path(@user)
    # else
    #   redirect_to login_path
    # end
  
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
