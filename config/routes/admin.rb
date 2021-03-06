Rails.application.routes.draw do
  constraints lambda { |request| request.domain.include? 'admin' } do
    namespace :admin, path: '/' do
      root to: 'top#index'

      resources :articles
    end
  end
end
