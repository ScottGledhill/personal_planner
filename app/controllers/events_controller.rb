class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    Event.create(event_params)
    redirect_to 'index'
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :place, :event)
  end
end
