class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :events, -> { order "start_date" }
end
