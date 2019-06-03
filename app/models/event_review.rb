class EventReview < ApplicationRecord
  belongs_to :event

  validates :rating, inclusion: { in: (0..5), allow_nil: false }
end
