Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :girlfriends, only: [:index, :show]

  namespace :account do
    resource :dashboard, only: :show, controller: 'dashboard'
    resources :girlfriends, only: [:index, :show, :new, :create]
  end
end
