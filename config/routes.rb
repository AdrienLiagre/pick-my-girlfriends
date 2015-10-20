Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :girlfriends, only: [:index, :show]

  namespace :account do
    resources :girlfriends, only: [:index, :show, :new, :create]
  end
end
