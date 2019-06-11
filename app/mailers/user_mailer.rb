class UserMailer < ApplicationMailer
  # testing setup, need to be removed after test
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to TravelMates')
  end

  def event_mate_up
    # setting the user who clide the btn-mateup, variables
    @user = params[:user]
    @event = params[:event]
    # event id??
    mail(to: @user.email, subject: 'Event Mate Up Confirm')
  end


end
