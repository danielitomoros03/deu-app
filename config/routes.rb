Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # RUTAS PARA AUTENTICACION CON DEVISE
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # RUTAS PARA EL PANEL DE ADMINISTRACIÓN
  get 'dashboard/index'
  
  namespace :dashboard do
    resources :users
    resources :pages
  end

  # RUTAS PARA EXPORTACIÓN DE DATOS JSON
  namespace :api do
    namespace :v1 do
      resources :pages, only: [:index, :show], defaults: { format: :json } do
        member do
          get 'large_description', defaults: { format: :json }
          get 'large_description_raw', defaults: { format: :json }
        end
      end 
    end
  end

  ## RUTAS PRINCIPALES PARA LA LANDING PAGE
  get "home/index" => "home#index", as: :index

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
end
