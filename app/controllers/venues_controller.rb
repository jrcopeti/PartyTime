class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order("name ASC")
  end

  def show
    @venue = Venue.find(params[:id])
    @events = Event.where("venue_id = ?", @venue.id).where("end_date > ?", Time.now).order("start_date ASC")
  end
end
