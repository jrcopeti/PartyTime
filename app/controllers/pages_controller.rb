class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    # Events Index
    if params[:query].present?
      @events_by_date = Event.where("end_date >= ?", Time.now).order("start_date ASC").global_search(params[:query]).group_by(&:start_date)
      @popular_events = Event.where("end_date >= ?", Time.now).global_search(params[:query]).sort_by { |event| -event.total_rsvps }.first(6)
    else
      @popular_events = Event.popular_events
      @events_by_date = Event.events_by_date
    end
    # respond_to do |format|
    #   format.html # Follow regular flow of Rails
    #   format.text { render partial: 'pages/list', locals: { popular_events: @popular_events, events_by_date: @events_by_date }}
    # end
  end
end
