class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_itinerary, only: %i[show edit update destroy]

  def index
    @itineraries = Itinerary.all
  end

  def show
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user

    if @itinerary.save
      redirect_to itinerary_path
    else
      render :new
    end
  end

  def new
    @itinerary = Itinerary.new
  end

  def edit
  end

  def update
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
