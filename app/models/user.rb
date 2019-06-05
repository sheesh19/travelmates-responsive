class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :itineraries
  has_many :events, through: :itineraries
  has_many :event_registrations

  has_many :favorite_itineraries
  has_many :favorite_users
  has_many :event_favorites # update the name in order to inline with schema and event_favorite model

  def favorited_itinerary?(itinerary)
    favorite_itineraries.where(itinerary: itinerary).any?
  end

  def find_favorite_itinerary(itinerary)
    favorite_itineraries.where(itinerary: itinerary).first
  end
end
