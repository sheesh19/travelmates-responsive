class LocationsController < ApplicationController
  before_action :set_location, only: :show

  def index
    Location.reindex
    @all_locations = Location.all
    @locations_sorted = @all_locations.sort_by_events
    # required for search
    unless params[:query].nil?
      @query = true
      sql_query = " \
      city ILIKE :query\
      OR country ILIKE :query\
      OR state ILIKE :query\
      "
      @locations = Location.where(sql_query, query: "%#{params[:query]}%")
      # @locations = Location.where('city ILIKE ?', "%#{params[:query]}%")
    else
      @query = false
      @locations = Location.all
    end
  end

  def show
    Event.all.where(location_id: @location.id)
    location_markers
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_markers
    @markers =
      {
        lat: @location.latitude,
        lng: @location.longitude
      }
  end
end
