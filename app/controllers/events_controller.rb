class EventsController < ApplicationController

  def index
    if params[:query].present?
      @events_by_date = Event.where("end_date > ?", Time.now).order("start_date ASC").global_search(params[:query]).group_by(&:start_date)
    else
      @events_by_date = Event.where("end_date > ?", Time.now).order("start_date ASC").group_by(&:start_date)
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
