class Event < ApplicationRecord
  belongs_to :location
  belongs_to :itinerary
  belongs_to :activity
end
