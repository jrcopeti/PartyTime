class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Controller of map page
    @venues = Venue.venues_with_event_happening_now
    @markers = @venues.geocoded.map do |venue|
      @events = venue.events.happening_now
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { venue: venue, events: @event }),
        # marker_html: render_to_string(partial: "markers", locals: { venue: venue, events: @events })
      }
    end
  end

  def show
    set_venue
    set_event
    @chatroom = Chatroom.where(name: @event.title).last
    @message = Message.new
    @rsvp = current_user.rsvp(@event) || Rsvp.new
    @artist = Event.find(params[:id])
    @current_attending = @rsvp.current_attending
    @all_current_attending = Rsvp.where(event: @event.id, current_attending: true).count
    @percentage_attending = @all_current_attending / @event.capacity.to_f * 100
    @busy_queue = nil
    if @percentage_attending >= 0 && @percentage_attending <= 30
      @busy_queue = "Not busy"
    elsif @percentage_attending >= 31 && @percentage_attending <= 60
      @busy_queue = "intermediate busy"
    elsif @percentage_attending >= 61 && @percentage_attending <= 99
      @busy_queue = "very busy"
    elsif @percentage_attending == 100
      @busy_queue = "Fully attending"
    end
  end

  def checkin
    set_venue
    set_event
    render partial: 'checkin', locals: { venue: @venue, event: @event }
  end

  def new
    @event = Event.new
    @lineup = Lineup.new
    @venues = Venue.all
    @artists = Artist.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      Chatroom.create!(name: @event.title)
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

  def favorite
    set_event
    @user = current_user
    current_user.favorite(@event)
  end

  def unfavorite
    set_event
    @user = current_user
    current_user.unfavorite(@event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :status, :category, :capacity, :dresscode, :start_date, :end_date, :venue_id, :photo, artist_ids: [])
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
