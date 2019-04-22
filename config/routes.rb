Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :new, :create] do
    get :confirm, on: :member
  end
  resources :cards, only: [:index, :new]
  resources :profiles, only: [:index, :edit]
  resources :users, only: [:show] do
    member do
      get :logout
      get :register
    end
  end
end
