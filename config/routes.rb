Rails.application.routes.draw do
  concern :order_resources do
    resources :orders
  end
  resource :profile
  resources :users
  # get 'clients/:id.pdf', to: 'clients#show'
  get '/clients/:status' => 'clients#index', foo: 'bar'
  get 'clients/download_pdf/:id', to: 'clients#download_pdf'
  get '/clients/:id', to: 'clients#show'
  get 'books/:id/:author_id', to: 'books#show'
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



  resources :welcomes do
    collection do
      get :stream
      get :show_sentences
    end
    member do
      get :show_sentences
    end
  end
  root 'welcomes#index'

  namespace :admin do
    resources :orders
  end

  # scope 'admin' do
  #   resources :photos, as: 'admin_photos'
  # end
end
