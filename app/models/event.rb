class Event < ApplicationRecord
  belongs_to :location
  belongs_to :itinerary
  belongs_to :activity

  has_many :event_reviews

  enum status: %i[open full cancelled]


  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end

  private

  def cancel
    self.update(status: :cancelled)
  end

  def full
    self.update(status: :full)
  end
end
