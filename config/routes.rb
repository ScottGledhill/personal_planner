Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    resources :attendances, only: [:new]
    resources :comments, shallow: true
  end
  # resources :users, only: [:show]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
