class FavoriteItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  before_action set_favoriteItinerary, only: :destroy
  before_action set_itinerary, only: create


  def create
    if !current_user
      flash[:alert] = 'You need to be logged in to add a favorite itinerary!'
      render js: "window.location = '/users/sign_in"
      return
    end

    current_user.favoriteitineraries.create(itinerary: @itinerary)

    respond_to_to |format|
      format.html { redirect_to @itinerary}
      format.js
    end
  end

  def destroy
    @itinerary = @favoriteIternary.itinerary
    @favoriteIternary.destroy
  end

  private

  def set_favoriteItinerary
    @favoriteIternary = FavoriteItinerary.find(params[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def favoriteItinerary_params
    params.require(:favoriteIternary).permit(:itinerary_id)
  end

end
