class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.text :place
      t.text :event

      t.timestamps
    end
  end
end
