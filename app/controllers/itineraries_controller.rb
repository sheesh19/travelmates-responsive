class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_itinerary, only: %i[show edit update destroy]

  def index
    @all_itineraries = Itinerary.all

    # add @favorite_itinerary to index
    @favorite_itinerary = FavoriteItinerary.find_by(itinerary_id: params[:itinerary_id], user_id: current_user)
    # required for search
    unless params[:query].nil?
      @query = true
      sql_query = " \
      itineraries.title ILIKE :query \
      OR itineraries.description ILIKE :query \
      OR locations.city ILIKE :query \
      OR locations.country ILIKE :query\
      OR locations.state ILIKE :query\
      "
      @itineraries = Itinerary.joins(events: :location).where(sql_query, query: "%#{params[:query]}%")
    else
      @query = false
      @itineraries = Itinerary.all
    end
  end

  def show
    @user = User.find(@itinerary.user_id)

    # Markers for the itinerary map
    @markers = @itinerary.events.map do |event|
      {
        lat: event.location.latitude,
        lng: event.location.longitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { event: event.title })
      }
    end
  end

  def user_itineraries
    Itinerary.where(user_id: current_user.id)
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user

    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  def new
    @itinerary = Itinerary.new
    render layout: 'application_without_sidebar'
  end

  def edit
  end

  def update
    @itinerary.update(itinerary_params)
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      render :edit
    end
  end

  def destroy
    @itinerary.destroy
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:user_id, :title, :start_date, :end_date, :status, :description)
  end
end
