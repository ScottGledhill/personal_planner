class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save!
    redirect_to '/'
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    if current_user != @event.user
      flash[:notice] = 'Can only edit events that you created'
      redirect_to event_path(@event)
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to ('/')
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user == @event.user
      @event.destroy
      redirect_to ('/')
    else
       flash[:notice] = 'Can\'t delete other peoples events'
       redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :place, :event, :image)
  end
end
