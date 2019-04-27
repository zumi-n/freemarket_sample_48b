Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks',
        sessions: 'users/sessions'
      }
  root 'items#index'
  resources :items, only: [:index, :show, :new, :create] do
    get :confirm, on: :member
  end
  #get "users/sign_up/registration", to: "users#new"
  resources :phonenumber
  resources :address
  resources :creditcards
  resources :cards, only: [:index, :new]
  resources :profiles, only: [:index, :edit]
  resources :users, only: [:show, :new] do
    member do
      get :logout
      get :register
    end
  end
end
