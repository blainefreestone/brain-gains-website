Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/about'
  get 'pages/how_it_works'
  get 'lead/home'
  get 'lead/about'
  get 'lead/how_it_works'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'leads/new'
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/how_it_works', to: 'pages#how_it_works'

  resources :leads, only: [:create]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
end
