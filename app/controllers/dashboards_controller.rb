class DashboardsController < ApplicationController
  before_action :set_user, only: :show
  before_action :set_itinerary, only: :show

  def show
  end

  private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find_by(user_id: current_user.id)
  end
end
