Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :new] do
    get :confirm, on: :member
    # post 'cards/pay', to: 'cards#pay'
  end
  # resources :cards, only: [:index, :new, :delete]
  get 'cards/new', to: 'cards#new'
  get 'cards/index', to: 'cards#index'
  post 'cards/pay', to: 'cards#pay'
  post 'cards/delete', to: 'cards#delete'
  resources :profiles, only: [:index, :edit]
  resources :users, only: [:show] do
    member do
      get :logout
      get :register
    end
  end
end
