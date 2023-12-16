Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resource :user, only: [:show] do
    resource :personal_information, only: [:show, :create, :edit, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
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
