Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        #,
        #omniauth_callbacks: 'users/omniauth_callbacks',
        sessions: 'users/sessions'
      }
  root 'items#index'
  resources :items do
    member do
      get :confirm
      post :purchase
    end
  end

  as :user do

    get "/sign_up/registration" => "users/registrations#registration"#会員情報入力
    post "/sign_up/tel" => 'users/registrations#tel'#電話番号登録
    post "/sign_up/address" => 'users/registrations#address'#住所確認
    post "/sign_up/credit" => 'users/registrations#credit'#クレジットカード
    post "/sign_up/create" => 'users/registrations#create'#DBに保存
    get "/sign_up/done" => 'users/registrations#done'#完了ページ
    get "/users/:id/profile" => 'users#profile', as: :user_profile
    patch "/users/:id/profile" => 'users#profile_update' , as: :update_user_profile
    get "/users/:id/logout" => "users#logout", as: :user_logout
  end

  resources :cards, only: [:index, :new, :destroy, :create]

  #get "users/sign_up/registration", to: "users#new"
  resources :phonenumber
  resources :address
  resources :creditcards
  resources :users, only: [:index, :edit, :new] do
    member do
      get :logout
      get :register
    end
  end
end
