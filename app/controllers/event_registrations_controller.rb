class EventRegistrationsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @eventregistration = EventRegistration.new
  end
end
