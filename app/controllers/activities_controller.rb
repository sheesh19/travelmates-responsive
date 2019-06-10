class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_activity, only: :show

  def index
    @all_activities = Activity.all
    # required for search
    unless params[:query].nil?
      @query = true
      @activities = Activity.where('title ILIKE ?', "%#{params[:query]}%")
    else
      @query = false
      @activities = Activity.all
    end
  end

  def show
    @events = Event.where(activity_id: params[:id])
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
