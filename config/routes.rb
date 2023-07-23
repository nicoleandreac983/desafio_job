Rails.application.routes.draw do
  devise_for :usuarios
  resources :oferta
  resources :usuarios
  resources :oferta do
    member do
      post 'postularse', to: 'oferta#postularse', as: :postularse_oferta
      get 'postulaciones', to: 'oferta#postulaciones', as: :postulacion
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "home#index"
end
