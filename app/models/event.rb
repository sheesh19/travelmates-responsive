class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :location
  belongs_to :itinerary
  belongs_to :activity

  has_many :event_reviews
  has_many :event_registrations
  has_many :tags, through: :event_tags
  default_scope { order('start_date ASC') }

  validates_presence_of :start_date, :end_date, :title
  # validate :start_date_cannot_be_in_the_past
  validate :end_date_is_after_start_date

  enum status: %i[open full cancelled]

  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end

  def full?
    # Determines if an Event is full
    EventRegistration.where(event_id: id).count <= max_spots
  end

  def solo?
    max_spots == 0 || max_spots.nil?
  end

  def spots_left
    if !max_spots.nil?
      approved = EventRegistration.where(status: 1).where(event_id: id).count
      # approved = EventRegistration.where(event_id: id) && EventRegistration.where(status: 1).count
      total = max_spots - approved
      total > 0 ? total || total : 0
    end
  end

  def list_of_mates
    self.event_registrations.map do |registration|
      registration
    end
  end

  def self.upcomings(user)
    # count event that current user is the event creater
    # count event that current user has joined
    user_created_count = Event.joins(:itinerary).where("itineraries.user_id = ? AND events.start_date > ?", user.id, Date.today).count
    user_joined_count = Event.joins(:event_registrations).where("event_registrations.user_id = ? AND events.start_date > ?", user.id, Date.today).count
    return user_joined_count + user_created_count
  end

  def self.upcoming
    Event.where("events.start_date > ?", Date.today)
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
