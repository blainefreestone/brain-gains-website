Rails.application.routes.draw do
  # Static home pages
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/how_it_works', to: 'pages#how_it_works'

  # Tutor Application Shortcut
  get '/apply', to: 'tutor_applications#show'

  # Users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # User
  resource :user, only: [:show] do
    resource :personal_information, only: [:show, :edit, :update]
    resources :engagements, only: [:show]
    resources :tutoring_sessions, only: [:index, :create, :update, :destroy]
    resource :tutor_application
  end

  # Lead create
  resources :leads, only: [:create]

  # Root path
  root "application#root"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
