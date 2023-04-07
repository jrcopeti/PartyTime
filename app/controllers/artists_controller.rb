class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order("name ASC")
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def favoriter
    set_artist
    if current_user.favorited?(@artist)
      current_user.unfavorite(@artist)
    else
      current_user.favorite(@artist)
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
