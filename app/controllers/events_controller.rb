class EventsController < ApplicationController

  def index
    # @events = Event.where('start_date <= ? AND end_date >= ?', DateTime.current, DateTime.current)
    # How do we get all venues  that  have events??

    @venues = Venue.joins(:events).where.not(events: {venue_id: nil}).geocoded
    # The `geocoded` scope filters only events with coordinates
    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end
  end

  def show
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:id])
  end

  def index_events_by_venue
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:venue_id]).where("end_date > ?", Time.now)

  end

  private

  def event_params
    params.require(:events).permit(:title, :description, :status, :category, :capacity, :dresscode, :start_date,
    :end_date, :start_time, :end_time)
  end

end
