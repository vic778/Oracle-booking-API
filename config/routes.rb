Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/register', to: 'users#create'
      post 'auth/login', to: 'sessions#login'
      get 'users', to: 'users#index'
      get 'users/:id', to: 'users#show'
      put 'users/:id', to: 'users#update'
      delete 'users/:id', to: 'users#destroy'
    end

    namespace :v2 do
      get 'cars', to: 'cars#index'
      get 'cars/:id', to: 'cars#show'
      post 'cars/new', to: 'cars#create'
      put 'cars/:id', to: 'cars#update'
      delete 'cars/:id', to: 'cars#destroy'

      post 'favorites', to: 'favorites#create'
      delete 'favorites/:id', to: 'favorites#destroy'

      get 'my_favorites', to: 'my_favorites#index'
    end
  end
 
end
