class AddEventIdToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :event_id, :integer
  end
end
