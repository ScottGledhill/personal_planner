class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @events = Event.all
  end

  def create
    @events = Event.create(event_params)
    redirect_to '/'
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    redirect_to ('/')
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to ('/')
  end

  private

  def event_params
    params.require(:event).permit(:date, :place, :event, :image)
  end
end
