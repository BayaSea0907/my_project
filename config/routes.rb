Rails.application.routes.draw do
  root :to => 'top#index'

  resources :users
  resources :password_resets, only: [:create, :edit, :update]

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  get 'logout' => 'user_sessions#destroy', :as => :logout
end
