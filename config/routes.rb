Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people
  resources :books
  resources :products
  resources :welcomes
  root 'welcomes#index'
end
