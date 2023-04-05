class VenuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @venues = Venue.all.order("name ASC")
  end

  def show
    @venue = Venue.find(params[:id])
    @events = Event.where("venue_id = ? AND end_date >= ?", @venue, Time.now).order(:start_date)
    @markers = [
      {
        lat: @venue.latitude,
        lng: @venue.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { venue: @venue })
        # marker_html: render_to_string(partial: "markers", locals: { venue: venue, events: @events })
      }
    ]
  end

  def favoriter
    set_venue
    if current_user.favorited?(@venue)
      current_user.unfavorite(@venue)
    else
      current_user.favorite(@venue)
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
