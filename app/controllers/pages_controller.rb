class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    # Events Index
    @popular_events = Event.popular_events
    if params[:query].present?
      @events_by_date = Event.where("end_date >= ?", Time.now).order("start_date ASC").global_search(params[:query]).group_by(&:start_date)
    else
      @events_by_date = Event.events_by_date
    end
  end
end
