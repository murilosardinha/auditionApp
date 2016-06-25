Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations:      "users/registrations",
      sessions:           "users/sessions",
      passwords:          "users/passwords"
    }

  root to: 'users#sign_in'

  get '/index' => 'home#index', as: :home

  get '/auditions/:year/:month_name'     => 'auditions#filter', as: :filter_audition
  get '/auditions/:year/:month_name/new' => 'auditions#new', as: :new_audition
  resources :auditions, except: :new

  resources :prosecutors
  resources :months
end
