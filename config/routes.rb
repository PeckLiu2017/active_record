Rails.application.routes.draw do
  concern :order_resources do
    resources :orders
  end
  resource :profile
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people, :clients, :books, :articles
  # resources :clients do
  #   resources :orders
  # end

  resources :clients, concerns: :order_resources

  resources :addresses
  resources :products do
    collection do
      get :search
    end
  end

  get '/clients/:id', to: 'clients#show'
  get 'books/:id/:author_id', to: 'books#show'

  resources :welcomes
  root 'welcomes#index'

  namespace :admin do
    resources :orders
  end
end
