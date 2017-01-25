class AttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
    @attendance.event = @event
    @attendance.user = current_user
    @attendance.save
    redirect_to event_path(@event)
  end
end
