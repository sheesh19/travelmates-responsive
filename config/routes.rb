Rails.application.routes.draw do
  get 'event_favorites/create'
  get 'event_favorites/destroy'
  devise_for :users
  root to: 'pages#home'
  resource :dashboard, only: :show
  # resources :home, only: :index  # dashboard


  # Nested Itinerary
  resources :itineraries do
    resources :favorite_itineraries, only: :create

    # Nested Event
    resources :events, except: [ :index ] do
      resources :event_reviews, only: [ :create, :show, :new ]
      resources :event_registrations, only: [ :create, :show, :new, :update ]
      resources :event_favorites, only: :create

      member do
        patch :cancel
      end
    end
  end

  resources :events, only: [ :index ]

  # Locations
  resources :locations, only: [ :index, :show ]

  # Favorites and Reviews Destroy
  resources :favorite_itineraries, only: :destroy
  resources :event_favorites, only: :destroy
  resources :favorite_users, only: :destroy
  resources :event_reviews, only: :destroy
  resources :event_registrations, only: :destroy

end
