class DashboardsController < ApplicationController
  before_action :set_user, only: :show
  before_action :set_itinerary, only: :show

  def show
    @users = User.all
    @total_events = @user.itineraries.map { |iti| iti.events.count }.reduce(&:+)
    @favorite_itineraries = FavoriteItinerary.where(user_id: @user.id)
    @event_favorites = EventFavorite.where(user_id: @user.id)
    @followers = Follow.where(following_id: @user)
    @followings = Follow.where(follower_id: @user)
  end

  private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find_by(user_id: current_user.id)
  end
end
