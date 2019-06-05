class FavoriteItinerary < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :user, uniqueness: { scope: :itinerary, message: "has already added this itinerary"}
end
