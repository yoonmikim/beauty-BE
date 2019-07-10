Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
     post '/login', to: 'auth#create'
     post '/carts', to: 'carts#create'
     delete '/cart/:id', to: 'carts#destroy'
     get '/carts', to: 'carts#index'

     get '/profile', to: 'users#profile'

      resources :products, only: [:index, :update]
      resources :users, only: [:show]
    end
  end
end
