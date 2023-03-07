class EventsController < ApplicationController
  before_action :authenticate_user!

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
    set_venue
    set_event
    @user = current_user
    @rsvp = current_user.rsvp(@event) || Rsvp.new
    @artist = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @venues = Venue.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to venue_event_path(@event.venue_id, @event), notice: "Event is ready to rock!"
    else
      render :new, status: :unprocessable_entity, notice: "Event could not be created."
    end
  end

  def edit
    set_event
    @venues = Venue.all
  end

  def update
    set_event
    if @event.user == current_user
      @event.update(event_params)
      redirect_to venue_event_path(@event.venue_id, @event), notice: "Event was updated successfully!"
    else
      render :edit, status: :unprocessable_entity, notice: "Event could not be updated."
    end
  end

  def destroy
    set_event
    if @event.user == current_user
      @event.destroy
      redirect_to events_path, status: :see_other, notice: "Event was deleted forever."
    else
      render :show, status: :unprocessable_entity, notice: "Event could not be deleted."
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :status, :category, :capacity, :dresscode, :start_date,
                                  :end_date, :venue_id)
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
