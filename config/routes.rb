Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    resources :attendances, only: [:destroy, :create]
    resources :comments, shallow: true
  end

  namespace :api do
    namespace :v1 do
      resources :events do
        resources :comments
      end
    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
