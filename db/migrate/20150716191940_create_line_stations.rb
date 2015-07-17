class CreateLineStations < ActiveRecord::Migration
  def change
    create_table :line_stations do |t|
      t.integer :line_id
      t.integer :station_id
      t.timestamps null: false
    end
  end
end
