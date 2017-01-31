Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    resources :attendances, only: [:destroy, :create]
    resources :comments, shallow: true
  end
  # resources :api do
  #   resources :v1 do
  #     resources :events
  #   end
  end
  # resources :users, only: [:show]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
