class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
    # event_markers

    # add @event_favorite to index
    @event_favorite = EventFavorite.find_by(event_id: params[:event_id], user_id: current_user)
  end

  def show
    event_markers
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @event = Event.new(event_params)

    if @event.save
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @event = Event.new
  end

  def edit
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
    redirect_to itinerary_path
  end

  private

  def event_markers
    @markers = @event.location.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event })
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
      :title
    )
  end
end
