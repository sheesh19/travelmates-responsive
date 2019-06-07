class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home explore]

  def home
    @itineraries = Itinerary.all
  end

  def explore
    @itineraries = Itinerary.all
    @events = Event.all
    @locations = Location.all
  end

  def kitchensink
    render layout: 'application_without_sidebar'
  end
end
