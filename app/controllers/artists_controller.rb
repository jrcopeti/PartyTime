class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order("name ASC")
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def favorite
    @artist = Artist.find(params[:id])
    @user = current_user
    current_user.favorite(@artist)
    redirect_to artist_path(@artist)
  end

  def unfavorite
    @artist = Artist.find(params[:id])
    @user = current_user
    current_user.unfavorite(@artist)
    redirect_to artist_path(@artist)
  end

end
