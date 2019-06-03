Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :dashboard, only: :show
  resources :home, only: :index  # dashboard


  # Nested Itinerary
  resources :itineraries do
    resources :events, only: [ :create, :show ]
    resources :favorite_itineraries, only: :create
  end

  # Nested Event
  resources :events do
    resources :event_reviews, only: [ :create, :show ]
    resources :event_registrations, only: [ :create, :show ]

    member do
      patch :cancel
    end
  end

  # Locations
  resources :locations, only: :show

  # Favorites
  resources :favorite_itineraries, only: :destroy
  resources :event_favorites, only: :destroy
  resources :favorite_users, only: :destroy
end
