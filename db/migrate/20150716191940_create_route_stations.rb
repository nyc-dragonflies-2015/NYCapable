class CreateRouteStations < ActiveRecord::Migration
  def change
    create_table :route_stations do |t|
      t.integer :route_id, null: false
      t.integer :station_id, null: false
      t.timestamps null: false
    end
  end
end
