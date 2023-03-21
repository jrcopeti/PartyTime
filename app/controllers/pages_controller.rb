class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    # Events Index
    @popular_events = Event.popular_events
    @events_by_date = Event.events_by_date
    if params[:query].present?
      @events_by_date = Event.where("end_date >= ?", Time.now).order("start_date ASC").global_search(params[:query]).group_by(&:start_date)
      @popular_events = Event.where("end_date >= ?", Time.now).global_search(params[:query]).sort_by { |event| -event.total_rsvps }.first(6) 
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list', locals: { events: [@events_by_date, @popular_events] } }
    end
  end
end
