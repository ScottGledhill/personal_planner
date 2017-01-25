class AddUserIdToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :user_id, :integer
  end
end
