class RsvpsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.create(user: current_user, event: @event)
    @rsvp.save!
    redirect_to event_path(@event)
  end
end
