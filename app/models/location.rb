class Location < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  def address
    [street, city, state, country].compact.join(', ')
  end

  def top_ten_activities
    @events = Event.all
    @events_location = @events.select { |event| event.location_id == id }
    activity_counter = Hash.new(0)

    @events_location.each do |event|
      activity = Activity.find(event.activity_id)
      activity_counter[activity] += 1
    end

    activity_counter.sort_by { |_, v| -v }[0..9]
  end

  def location_events
    @events = Event.all
    @events.select { |event| event.location_id == id }
  end
end
