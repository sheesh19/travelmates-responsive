class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :events, -> { order :start_date }
  default_scope { order('start_date ASC') }

  validates_presence_of :start_date, :end_date, :title
  validate :start_date_cannot_be_in_the_past
  validate :end_date_is_after_start_date

                  #  0     1
  enum status: %i[draft confirmed]
  enum trip_type: %i[solo grouped]
  enum visibility: %i[hidden visible]

  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end

  def total_time
    difference = self.end_date - self.start_date
    diff = difference.to_i / 86400
  end

  def self.most_popular_itineraries
    # Top ten itineraries by number of favs
    Itinerary.all.map{ |x| [FavoriteItinerary.where(itinerary_id: x.id).count, x] }.sort.reverse!
  end

  private

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
