class EventsController < ApplicationController
  
  def index
    if params [:query].present?
      @events = Event.where("end_date < ?", Time.now).global_search(params[:query])
    else
      @events = Event.where("end_date < ?", Time.now)
    end
  end

  def show
    @events = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:events).permit(:title, :description, :status, :category, :capacity, :dresscode, :start_date,
    :end_date, :start_time, :end_time)
  end

end
