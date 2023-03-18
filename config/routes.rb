Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  resources :venues, only: %i[index show] do
    resources :events, only: %i[show edit]
  end

  get '/venues/:id/favorite' => 'venues#favorite', as: :favorite_venue
  get '/venues/:id/unfavorite' => 'venues#unfavorite', as: :unfavorite_venue

  get '/artists/:id/favorite' => 'artists#favorite', as: :favorite_artist
  get '/artists/:id/unfavorite' => 'artists#unfavorite', as: :unfavorite_artist

  get '/events/:id/favorite' => 'events#favorite', as: :favorite_event
  get '/events/:id/unfavorite' => 'events#unfavorite', as: :unfavorite_event

  resources :events, only: %i[index new create update destroy] do
    resources :rsvps, only: %i[create destroy update]
    resources :lineups, only: %i[show new create edit update]
  end

  resources :users, only: %i[index show edit update]
  get 'users/:id/profile' => 'users#profile', as: :profile

  post 'users/:id/follow' => 'users#follow', as: :follow
  post 'users/:id/unfollow' => 'users#unfollow', as: :unfollow
  post 'users/:id/accept' => 'users#accept', as: :accept
  post 'users/:id/decline' => 'users#decline', as: :decline
  post 'users/:id/cancel' => 'users#cancel', as: :cancel



  resources :artists, only: %i[index show]
  resources :lineups, only: %i[destroy]

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
