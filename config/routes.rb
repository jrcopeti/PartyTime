Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :venues, only: %i[index show] do
    resources :events, only: %i[show edit]
  end

  resources :events, only: %i[index new create update destroy] do
    resources :rsvps, only: :create
    resources :lineups, only: %i[show new create edit update]
  end
  resources :profile, only: :show
  resources :users, only: %i[show edit update]
  resources :artists, only: %i[index show]
  resources :lineups, only: %i[destroy]
end
