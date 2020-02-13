Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  # get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get  '/home',    to: 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',    to: 'static_pages#about'
  get  '/contact',    to: 'static_pages#contact'
  # get  'static_pages/home'
  # get  'static_pages/about'
  # get  'static_pages/help'
  # get  'static_pages/contact'
  get  '/signup',  to: 'users#new'
  get  '/show', to: 'users#show'
  post  '/download_csv', to: 'users#download_zip_csv'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/auth/:provider/callback', :to => 'sessions#create_provider'
  # get '/auth/failure', :to => 'sessions#failure'

  # resources :sessions
  # resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
end
