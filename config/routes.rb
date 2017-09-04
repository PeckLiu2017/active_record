Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people
  resources :books
  resources :articles
  resources :clients
  resources :addresses
  resources :products do
    collection do
      get :search
    end
  end
  resources :welcomes
  root 'welcomes#index'
end
