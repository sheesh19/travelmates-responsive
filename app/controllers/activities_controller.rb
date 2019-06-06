class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_activity, only: :show

  def index
    @activities = Activity.all
  end

  def show
    @events = Event.where(activity_id: params[:id])
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
