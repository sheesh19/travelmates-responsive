Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :dashboard, only: :show
  # resources :home, only: :index  # dashboard


  # Nested Itinerary
  resources :itineraries do
    resources :favorite_itineraries, only: :create

    # Nested Event
    resources :events do
      resources :event_reviews, only: [ :create, :show, :new ]
      resources :event_registrations, only: [ :create, :show, :new, :update ]

      member do
        patch :cancel
      end
    end
  end

  # Locations
  resources :locations, only: [ :index, :show ]

  # Favorites and Reviews Destroy
  resources :favorite_itineraries, only: :destroy
  resources :event_favorites, only: :destroy
  resources :favorite_users, only: :destroy
  resources :event_reviews, only: :destroy
  resources :event_registrations, only: :destroy

end