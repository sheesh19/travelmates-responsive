class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @all_events = Event.all
    event_markers_all
    # add @event_favorite to index
    @event_favorite = EventFavorite.find_by(event_id: params[:event_id], user_id: current_user)
    # required for search
    unless params[:query].nil?
      @query = true
      sql_query = " \
      events.title ILIKE :query \
      OR locations.city ILIKE :query \
      OR locations.country ILIKE :query\
      OR locations.state ILIKE :query\
      "
      @events = Event.joins(:location).where(sql_query, query: "%#{params[:query]}%")
    else
      @query = false
      @events = Event.all
    end
  end

  def show
    event_markers
    @event_registration = EventRegistration.new
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = Activity.find(params[:event][:activity_id])
    @location = Location.event_geocoder(params[:event][:location])
    @event = Event.new(event_params)
    @event.location = @location
    @event.itinerary = @itinerary

    if @location && @event.save
      redirect_to itinerary_path(@itinerary)
    elsif @location.nil?
      flash[:notice] = 'Please locate your location.'
      render :new
    else
      render :new
    end
  end

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @event = Event.new
    render layout: 'application_without_sidebar'
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to itinerary_event_path(@event.itinerary, @event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to itinerary_path
  end

  private

  def event_markers
    @markers =
      {
        lat: @event.location.latitude,
        lng: @event.location.longitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: @event.title })
      }
  end

  def event_markers_all
    @markers = @all_events.map do |event|
      {
        lat: event.location.latitude,
        lng: event.location.longitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event.title })
      }
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :activity_id,
      :location_id,
      :itinerary_id,
      :start_date,
      :end_date,
      :max_spots,
      :description,
      :title,
      :photo
    )
  end
end
