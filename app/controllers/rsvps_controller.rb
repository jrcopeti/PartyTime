class RsvpsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @rsvp = Rsvp.create(user: current_user, event: @event)
    @rsvp.save!
    redirect_to event_path(@event)
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:event_id])
    @rsvp = current_user.rsvp(@event)
    @rsvp.destroy
    redirect_to event_path(@event)
  end

  def update
    @user = current_user
    @event = Event.find(params[:event_id])
    @rsvp = current_user.rsvp(@event)
    if @rsvp.current_attending
      @rsvp.update(:current_attending => false)
    else
      @rsvp.update(:current_attending => true)
    end
    redirect_to event_path(@event)

  end
end
# create a new migration add column of current there as boolean
# on the controller check the date of party is currently happening and if the user is attending.
# show the button say i'm here.
# with this show the Event.rsvps.where("currently_there = true)
