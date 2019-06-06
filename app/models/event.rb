class Event < ApplicationRecord
  belongs_to :location
  belongs_to :itinerary
  belongs_to :activity

  has_many :event_reviews

  validates_presence_of :start_date, :end_date, :title
  validate :start_date_cannot_be_in_the_past
  validate :end_date_is_after_start_date

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

  def start_date_cannot_be_in_the_past
    if !start_date.blank? and start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end
end
