Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Página principal
  root "home#index"
  
  # Páginas de DEUWEB
  get "about", to: "about#index"
  get "contactos", to: "contact#index"
  get "departamentos1", to: "departamentos#index1"
  get "departamentos2", to: "departamentos#index2"
  get "departamentos3", to: "departamentos#index3"
  get "programas1", to: "programas#index1"
  get "programas2", to: "programas#index2"
  get "programas3", to: "programas#index3"
 
  # Rutas adicionales que puedas necesitar
  get "home/index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
