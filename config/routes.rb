Rails.application.routes.draw do
  draw :admin

  root to: 'top#index'

  resources :users
  resources :password_resets, only: %i[create edit update]

  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy', as: :logout

  resources :articles, only: %i[index show] do
    collection do
      get :search
    end
  end
end
