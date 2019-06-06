class FavoriteItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  before_action :set_favorite_itinerary, only: :destroy
  before_action :set_itinerary, only: :create

  def create
    if !current_user
      flash[:alert] = 'You need to be logged in to add a favorite itinerary!'
      render js: "window.location = '/users/sign_in'"
      return
    end

    current_user.favorite_itineraries.create(itinerary: @itinerary)

    respond_to do |format|
      format.html { redirect_to @itinerary }
      format.js
    end
  end

  def destroy
    @itinerary = @favorite_itinernary.itinerary
    @favorite_itinernary.destroy

    respond_to do |format|
      format.html { redirect_to @itinerary }
      format.js { render action: :create }
    end
  end

  private

  def set_favorite_itinerary
    @favorite_itinernary = FavoriteItinerary.find(params[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def favorite_itinerary_params
    params.require(:favorite_Itinernary).permit(:itinerary_id)
  end
end
