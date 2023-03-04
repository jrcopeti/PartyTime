class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order("name ASC")
  end

  def show
    @venue = Venue.find(params[:id])
    @events = Event.where("venue_id = ? AND end_date > ?", @venue.id, Time.now).order("start_date ASC")
  end
end
