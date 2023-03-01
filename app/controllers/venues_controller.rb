class VenuesController < ApplicationController
  def index
    Venue.all
  end

  def show
    Venue.find(params[:id])
  end
end
