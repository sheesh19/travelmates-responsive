class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home explore]

  def home
    @itineraries = Itinerary.all
  end

  def explore
    @itineraries = Itinerary.all
    @activities = Activity.all
    @events = Event.all
    @locations = Location.all
    @favorite_itinerary = FavoriteItinerary.find_by(itinerary_id: params[:itinerary_id], user_id: current_user)
  end

  def kitchensink
    render layout: 'application_without_sidebar'
  end
end
