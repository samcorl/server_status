class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
