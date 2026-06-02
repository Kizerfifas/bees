Rails.application.routes.draw do
  resources :inspections
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  resources :users do
    resources :bee_families, only: [:index, :new, :create]
  end
  resources :bee_families, except: [:index, :new, :create] do
    member do
      get :edit_avatar
      patch :update_avatar
    end
  end
  root "users#index"

  get 'profile', to: 'users#profile', as: :profile
  get 'profile/edit_avatar', to: 'users#edit_avatar', as: :edit_avatar
  patch 'profile/update_avatar', to: 'users#update_avatar', as: :update_avatar
end
