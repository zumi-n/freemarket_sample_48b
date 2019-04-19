Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:show, :edit] do
    get :logout, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'items/new'
end
