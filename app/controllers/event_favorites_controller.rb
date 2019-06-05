class EventFavoritesController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  before_action :set_event_favorite, only: :destroy
  before_action :set_event, only: :create

  def create
    if !current_user
      flash[:alert] = 'You need to be logged in to add a favorite event!'
      render js: "window.location = '/users/sign_in"
      return
    end

    current_user.event_favorites.create(event: @event)

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  def destroy
    @event = @event_favorite.event
    @event_favorite.destroy

    respond_to do |format|
      format.html { redirect_to @event }
      format.js
    end
  end

  private

  def set_event_favorite
    @event_favorite = EventFavorite.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def event_favorite_params
    params.require(:event_favorite).permit(:event_id)
  end
end
