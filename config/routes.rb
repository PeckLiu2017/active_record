Rails.application.routes.draw do
  resource :profile
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people, :clients, :books, :articles
  resources :clients do
    resources :orders
  end

  resources :addresses
  resources :products do
    collection do
      get :search
    end
  end

  get '/clients/:id', to: 'clients#show'
  resources :welcomes
  root 'welcomes#index'

  namespace :admin do
    resources :orders
  end
end
