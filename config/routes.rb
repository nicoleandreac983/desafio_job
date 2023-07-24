Rails.application.routes.draw do
  devise_for :usuarios
  resources :oferta, only: [:show]
  resources :oferta do
    member do
      post 'postularse', to: 'usuarios#postulaciones', as: :postularse
    end
    get 'postularse', to: 'oferta#postulaciones', as: :postulaciones
  end

  resources :usuarios, only: [] do
    get 'postulaciones', on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

