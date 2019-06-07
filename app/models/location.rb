class Location < ApplicationRecord
  has_many :events
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

  def self.event_geocoder(location_name)
    if Location.find_by(city: location_name)
      return Location.find_by(city: location_name)
    else
      r = Geocoder.search(location_name)
      return if r.empty?

      Location.create(
        city: location_name,
        country: r[0].data["address"]["country"],
        state: r[0].data["address"]["state"],
        latitude: r[0].data["lat"],
        longitude: r[0].data["lon"]
      )
    end
  end
end
