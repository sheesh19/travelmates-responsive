class LocationsController < ApplicationController
  before_action :set_location, only: :show

  def index
    @locations = Location.all
    @locations_sorted = @locations.sort_by_events
  end

  def show
    @markers =
      {
        lat: @location.latitude,
        lng: @location.longitude
      }
    Event.all.where(location_id: @location.id)
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
