Rails.application.routes.draw do
  # Resources for Active Admin
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Resources for Pages & Sign In
  devise_for :users
  root to: 'pages#home'
  resource :dashboard, only: :show

  # resources :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      post :follow
      post :unfollow
    end
  end

  # resources :pages, only: :explore
  get 'pages/explore', to: 'pages#explore'


  # Nested Itinerary
  resources :itineraries do
    get :user_itineraries, on: :collection
    resources :favorite_itineraries, only: :create

    # Nested Event
    resources :events, except: [ :index ] do
      resources :event_reviews, only: [ :create, :show, :new ]
      resources :event_favorites, only: :create
      resources :event_registrations, only: [ :create, :show, :new, :update ] do
        member do
          patch :approve
        end
      end

      member do
        patch :cancel
      end
    end
  end

  # Events Index
  resources :events, only: [ :index ]

  #Activities Pages
  resources :activities, only: [ :index, :show ]

  # Locations
  resources :locations, only: [ :index, :show ]

  # Favorites and Reviews Destroy
  resources :favorite_itineraries, only: :destroy
  resources :event_favorites, only: :destroy
  resources :favorite_users, only: :destroy
  resources :event_reviews, only: :destroy
  resources :event_registrations, only: :destroy

  # Component kitchensink page only for development
  if Rails.env.development?
    get 'kitchensink', to: 'pages#kitchensink'
  end

end
