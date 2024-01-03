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
    resource :personal_information, only: [:edit, :update]
    resources :engagements, only: [:show]
    resources :tutoring_sessions, only: [:index, :create, :update, :destroy]
    resource :tutor_application
    get '/pricing', to: 'stripe/checkout#pricing'
    post '/stripe/checkout', to: 'stripe/checkout#create'
    get '/stripe/checkout/success', to: 'stripe/checkout#success'
    get '/stripe/checkout/failure', to: 'stripe/checkout#failure'
  end

  # Lead create
  resources :leads, only: [:create]

  # Stripe
  post 'stripe/webhooks', to: 'stripe/webhooks#create'

  # Root path
  root "application#root"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
