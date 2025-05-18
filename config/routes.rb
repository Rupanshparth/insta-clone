Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "public#homepage" 
  get "/about" => "public#about"
  get "/contact" => "public#contact"
  get "profile/:username" => "accounts#profile", as: :profile
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/dashboard" => "accounts#index"
  resources :posts
  resources :posts do
    resource :like, only: [:create, :destroy]
  end

  resources :accounts, only: [:show] do
    post 'follow', to: 'follows#create'
    delete 'unfollow', to: 'follows#destroy'
  end

  resources :accounts, only: [:show] do
    member do
      get :followers
      get :following
    end
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
