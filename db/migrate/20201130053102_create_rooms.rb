class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name,    null: false
      t.string :home_away,    null: false
      t.date :match_day,      null: false
      t.time :match_time,     null: false
      t.timestamps
    end
  end
end
