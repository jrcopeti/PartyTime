Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  resources :venues, only: %i[index show] do
    resources :events, only: %i[show edit]
    member do
      get :favorite
      get :unfavorite
    end
  end


  resources :events, only: %i[index new create update destroy] do
    resources :rsvps, only: %i[create destroy update]
    resources :lineups, only: %i[show new create edit update]
    member do
      get :favorite
      get :unfavorite
    end
  end

  resources :artists, only: %i[index show] do
    member do
      get :favorite
      get :unfavorite
    end
  end

  resources :lineups, only: %i[destroy]

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end

  resources :users, only: %i[index show edit update] do
    member do
      get :profile
      get :followers
      get :following
      post :follow
      post :unfollow
      post :accept
      post :decline
      post :cancel
    end
  end
end
