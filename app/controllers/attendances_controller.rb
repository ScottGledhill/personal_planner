class AttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    attendance = Attendance.new
    attendance.event = event
    attendance.user = current_user
    attendance.save
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find params[:event_id]
    attendance = event.attendances.where(user_id: current_user.id).first
    attendance.destroy if attendance.present?
    redirect_to event_path(event)
  end
end
