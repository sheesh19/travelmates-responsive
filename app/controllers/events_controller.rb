class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_itinerary, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to itinerary_path
    else
      render :new
    end
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:user_id, :title, :start_date, :end_date, :status, :description)
  end

end
