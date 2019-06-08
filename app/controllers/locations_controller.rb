class LocationsController < ApplicationController
  before_action :set_location, only: :show

  def index
    @locations = Location.all
    @locations_sorted = @locations.sort_by_events
  end

  def show
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end
end
