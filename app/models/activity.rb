class Activity < ApplicationRecord
  has_many :events
  default_scope { order('title ASC') }

  def top_act_by_location
    @events = Event.all
    @events_activity = @events.select { |event| event.activity_id == id }
    location_counter = Hash.new(0)

    @events_activity.each do |event|
      location = Location.find(event.location_id)
      location_counter[location] += 1
    end

    location_counter.sort_by { |_, v| -v }[0..9]
  end
end
