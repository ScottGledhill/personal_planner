class FixedLastMistake < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_id
    add_column :comments, :event_id, :integer
  end
end
