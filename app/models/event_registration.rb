class EventRegistration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # enum status: %i[open full]

  private
end
