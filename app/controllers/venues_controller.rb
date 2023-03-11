class VenuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @venues = Venue.all.order("name ASC")
  end

  def show
    @venue = Venue.find(params[:id])
    @events = Event.where("venue_id = ? AND end_date >= ?", @venue, Time.now).order(:start_date)
  end

  def favorite
    @venue = Venue.find(params[:id])
    @user = current_user
    current_user.favorite(@venue)
    redirect_to venue_path(@venue)
  end

  def unfavorite
    @venue = Venue.find(params[:id])
    @user = current_user
    current_user.unfavorite(@venue)
    redirect_to venue_path(@venue)
  end
end
