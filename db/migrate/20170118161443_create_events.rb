class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.time :time
      t.string :place

      t.timestamps
    end
  end
end
