Rails.application.routes.draw do
  devise_for :users
  # Devise routes with custom paths
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root 'static#home'  # Sets the home page as the root

  # You can add more routes as needed
end
