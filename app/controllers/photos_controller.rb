class PhotosController < ApplicationController

private
  def article_params
    params.require(:photo).permit(:title, :description, :photo)
  end
end
