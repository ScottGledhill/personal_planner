Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    resources :comments, only: [:new]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
