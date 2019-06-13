class EventRegistrationsController < ApplicationController
  before_action :set_event_registration, only: %i[show cancel update]
  before_action :set_event, only: :create

  def new
    @event_registration = Registration.new
    @event_registration.user = current_user
    @event_registration.event = Event.find(params[:event_id])
  end

  def create
    @event_registration = EventRegistration.new
    @event_registration.user = current_user
    @event_registration.event = @event
    @event_registration.status = 0

    if @event_registration.save
      # trigger email notification
      # mail = UserMailer.with(user: current_user, event: @event).event_mate_up error with heroku
      # mail.deliver_now error with heroku
      redirect_to itinerary_event_path(@event.itinerary, @event)#, #flash[:notice] = 'Your mate up request is pending!'
    else
      render "events/show"
    end
  end

  def update
    @event_registration.update(event_registration_params)
    if @event_registration.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def cancel
    @event_registration.cancelled!
    redirect_to dashboard_path
  end

  private

  def set_event_registration
    @event_registration = EventRegistration.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def event_registration_params
    params.require(:event_registration).permit(:status)
  end
end
