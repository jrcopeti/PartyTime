class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.order("name ASC")
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
