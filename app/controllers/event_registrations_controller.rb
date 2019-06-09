class EventRegistrationsController < ApplicationController
  before_action :set_event_registration, only: %i[show cancel]
  before_action :set_event, only: :create

  def create
    @event_registration = EventRegistration.new(reservation_params)
    @event_registration.event = @event
    @event_registration.user = current_user
    @event_registration.status = 1

    if @event_registration.save
      redirect_to dashboard_path
      # potentially render an alert ?
    else
      render "events/show"
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
    params.require(:event_registration).permit(:user_id, :event_id, :status)
  end
end
