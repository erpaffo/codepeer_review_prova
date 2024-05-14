# config/routes.rb
Rails.application.routes.draw do
  get 'accounts/connect'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'landing#index'

  resources :projects do
    resources :snippets do
      resources :comments, only: [:create]
      resources :reviews, only: [:create]
    end
  end

  resources :badges, only: [:index, :show, :new, :create]
  resources :activities, only: [:index]

  resource :profile, only: [:show, :edit, :update], controller: 'users'
  get 'dashboard', to: 'dashboard#index'
  get 'community', to: 'community#index'
  get 'settings', to: 'settings#index'

  # Definisci le rotte per my snippets e resume snippet
  get 'my_snippets', to: 'snippets#my_snippets', as: 'my_snippets'
  get 'resume_snippet', to: 'snippets#resume_snippet', as: 'resume_snippet'

  # Definisci la rotta per connect account
  get 'connect_account', to: 'accounts#connect', as: 'connect_account'

  namespace :api do
    resources :github, only: [:index] do
      member do
        post 'import'
      end
    end
    resources :gitlab, only: [:index] do
      member do
        post 'import'
      end
    end
  end
end
