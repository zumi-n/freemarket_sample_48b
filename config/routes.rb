Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show]
  resources :cards, only: [:index, :new]
  resources :profiles, only: [:index, :edit]
  resources :users, only: [:show] do
    member do
      get :logout
      get :register
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'items/new'
end
